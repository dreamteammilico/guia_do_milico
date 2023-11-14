import
'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/ui/helpers/loader.dart';
import 'package:guia_do_milico/modules/security/controllers/user_data_controller.dart';
import 'package:guia_do_milico/modules/security/models/user.dart';
import 'package:guia_do_milico/modules/security/repository/user_repository.dart';
import 'package:guia_do_milico/modules/security/services/auth_service.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  late AuthService authService;
  late UserRepository userRepository;
  late UserDataController userDataController;


  @override
  void onInit() {
    authService = Get.put(AuthService());
    userRepository = Get.put(UserRepository());
    userDataController = Get.put(UserDataController());
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value != null && value.isEmpty) {
      return 'O campo é obrigatório';
    }
    return null;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      LoadDialog.showSpin();
      try {
        var user = await authService.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
        if (user != null) {
          User userModel = User(
            name: (user.displayName != null) ? user.displayName! : user.email!,
            uid: user.uid,
            email: user.email!,
            provider: user.providerData.first.providerId,
            phoneNumber: user.phoneNumber,
            createdAt: Timestamp.now().toString(),
            lastLogin: Timestamp.now().toString(),
            surname: "",
          );
          userDataController.setUserData(userModel);
          userRepository.setUser(userModel);
        }
      } catch (err, _) {
        LoadDialog.hide();
        passwordController.clear();
        rethrow;
      }
    } else {
      throw Exception('Ocorreu um erro, valores inválidos');
    }
  }

  Future<bool> loginWithGoogle() async {
    LoadDialog.showSpin();

    try {
      var user = await authService.signInWithGoogle();

      if (user != null) {
        var timestamp = Timestamp.now();
        User userModel = User(
          name: user.displayName!,
          uid: user.uid,
          photo: user.photoURL,
          email: user.email!,
          provider: user.providerData.first.providerId,
          phoneNumber: user.phoneNumber,
          createdAt: timestamp.toString(),
          lastLogin: timestamp.toString(),
          surname: "",
        );
        userDataController.setUserData(userModel);
        userRepository.setUser(userModel);
        LoadDialog.hide();

        return true;
      }
      return false;
      // Get.offAll(() => IntroductionPage());
    } catch (err, _) {
      LoadDialog.hide();

      rethrow;
    }
  }

  bool isUserAuthenticated() {
    return (authService.currentUser != null);
  }
}
