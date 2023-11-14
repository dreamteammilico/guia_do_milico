import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/ui/theme/theme_config.dart';
import 'package:guia_do_milico/modules/home/controllers/home_controller.dart';
import 'package:guia_do_milico/modules/home/controllers/introduction_controller.dart';
import 'package:guia_do_milico/modules/home/screens/home_page.dart';
import 'package:guia_do_milico/modules/home/screens/introduction_page.dart';
import 'package:guia_do_milico/modules/news/controllers/news_controller.dart';
import 'package:guia_do_milico/modules/permission/controllers/permission_controller.dart';
import 'package:guia_do_milico/modules/security/controllers/login_controller.dart';
import 'package:guia_do_milico/modules/security/controllers/sign_in_controller.dart';
import 'package:guia_do_milico/modules/security/screens/login_page.dart';
import 'package:guia_do_milico/modules/security/services/auth_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'modules/permission/screens/permission_page.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  var locationPermission = await Permission.location.status.isGranted;


  final User? user = FirebaseAuth.instance.currentUser;
  var userIsAuthenticated = false;
  if (user != null) {
    userIsAuthenticated = true;
  }

  runApp(GetMaterialApp(
    theme: ThemeConfig.theme,
    debugShowCheckedModeBanner: false,
    home: (userIsAuthenticated) ? IntroductionPage() : locationPermission ? LoginPage() : PermissionPage(),
    initialBinding: BindingsBuilder(() {
      Get.put(LoginController());
      Get.put(NewsController());
      Get.put(PermissionController());
      Get.put(HomeController());
      Get.put(SignInController());
      Get.put(IntroductionController());
    }),
  ));
}
