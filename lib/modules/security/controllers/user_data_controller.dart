import
'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/ui/helpers/loader.dart';
import 'package:guia_do_milico/modules/security/models/user.dart';
import 'package:guia_do_milico/modules/security/repository/user_repository.dart';
import 'package:guia_do_milico/modules/security/services/auth_service.dart';

class UserDataController extends GetxController {

  late Rx<User> user = User.empty().obs;

  void setUserData(User? currentUser){
    user.value = currentUser!;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }






}
