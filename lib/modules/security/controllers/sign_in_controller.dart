import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/modules/security/controllers/user_data_controller.dart';
import 'package:guia_do_milico/modules/security/models/user.dart';
import 'package:guia_do_milico/modules/security/repository/user_repository.dart';
import 'package:guia_do_milico/modules/security/services/auth_service.dart';

import '../../../common/ui/helpers/loader.dart';
import '../screens/login_page.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>(debugLabel: '__signInFormKey__');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  late AuthService authService;
  late UserRepository userRepository;
  late UserDataController userDataController;

  late auth.User? user;


  @override
  void onInit() async {
    authService = Get.find();
    userRepository = Get.find();
    userDataController = Get.find();
    await initUser();

    super.onInit();
  }


  initUser() async {
    try {
      user = auth.FirebaseAuth.instance.currentUser;
      if(user != null){
        authService.currentUser = user;
        userDataController.setUserData(await userRepository.getUserByUid(user!.uid));
      }
    } catch (err, _) {
       rethrow;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'O campo é obrigatório';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'O campo é obrigatório';
    }
    return null;
  }

  String? retypeValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'O campo é obrigatório';
    }
    if (value != passwordController.text) {
      return 'As senhas não conferem';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    String patttern = r'^\([1-9]{2}\) 9[6-9]\d{3}\-\d{4}$';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return 'Digite um telefone válido';
    }
    return null;
  }

  Future<void> signIn() async {
    LoadDialog.showSpin();
    try {
      var user = await authService.creatUserWithEmailAndPassword(
          emailController.text, passwordController.text);
      if (user != null) {
        User userModel = User(
          name: nameController.text,
          uid: user.uid,
          email: user.email!,
          provider: user.providerData.first.providerId,
          phoneNumber: phoneNumberController.text,
          createdAt: Timestamp.now().toString(),
          lastLogin: Timestamp.now().toString(),
          surname: surnameController.text,
        );
        userDataController.setUserData(userModel);
        userRepository.setUser(userModel);
        LoadDialog.hide();

      }
    } catch (err, _) {
      LoadDialog.hide();
      rethrow;
    }
  }

  Future<void> signOut()async{
    LoadDialog.showSpin();
    await auth.FirebaseAuth.instance.signOut();
    LoadDialog.hide();
    Get.offAll(LoginPage());
  }




}
