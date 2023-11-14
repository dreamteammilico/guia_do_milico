import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guia_do_milico/common/components/common_appbar.dart';
import 'package:guia_do_milico/common/ui/common_view.dart';
import 'package:guia_do_milico/common/ui/styles/app_styles.dart';
import 'package:guia_do_milico/modules/home/screens/introduction_page.dart';
import 'package:guia_do_milico/modules/security/controllers/login_controller.dart';
import 'package:guia_do_milico/modules/security/screens/sign_in_page.dart';

import '../../../common/components/logo_widget.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LoginPage extends CommonView<LoginController> {
  LoginPage({super.key});

  @override
  CommonAppBar? getAppbar({String? title}) {
    return null;
  }

  @override
  Widget? getPageBody() {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: super.controller.loginFormKey,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
      
              children: [
      
                Logo(),
      
                SizedBox(height: 20,),
      
                CustomTextFormField(
                  editingController: super.controller.emailController,
                  icon: Icons.email,
                  hintText: 'E-mail',
                  validator: super.controller.validator,
                  isPassword: false,
                ),
      
                SizedBox(height: 10,),
      
                CustomTextFormField(
                  editingController: super.controller.passwordController,
                  icon: Icons.lock,
                  hintText: 'Senha',
                  isPassword: true,
                  validator: super.controller.validator,
                ),
                SizedBox(height: 20,),
      
                CustomButton(
                  onPressed: () async {
                    if (super.controller.loginFormKey.currentState!.validate()) {
                      try {
                        await super.controller.login();
                        Get.offAll(() => IntroductionPage());
                      } catch (err, _) {
                        printError(info: err.toString());
                        Get.snackbar(
                          "Erro!",
                          err.toString(),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red.withOpacity(.75),
                          colorText: Colors.white,
                          icon: Icon(Icons.error, color: Colors.white),
                          shouldIconPulse: true,
                          barBlur: 20,
                        );
                      } finally {}
      
                      super.controller.loginFormKey.currentState!.save();
                    }
                  },
                  label: 'Login',
                )        ,
                SizedBox(height: 10,),
      
                TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    'Esqueceu sua senha?',
                    style: TextStyles.instance.textRegular,
                  ),
                ),
                SizedBox(height: 10,),
      
      
                 Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                        indent: 0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8),
                      child: Text(
                        "ou acesse com",
                        style: TextStyles.instance.textRegularWhite,

                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    SizedBox(width: 0),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Platform.isIOS
                          ? Get.width * 0.26
                          : Get.width * .28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(
                            10),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          try {
                            await super.controller.loginWithGoogle()
                                ? Get.offAll(() => IntroductionPage())
                                : null;
                          } on PlatformException catch (e) {
                            if (e.code == GoogleSignIn.kSignInCanceledError) {
                              printError(info: e.toString());
                            }
                          } on FirebaseAuthException catch (e) {
                          } catch (err, _) {
                            printError(info: err.toString());
                            Get.snackbar(
                              "Erro!",
                              err.toString(),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.withOpacity(.75),
                              colorText: Colors.white,
                              icon: const Icon(Icons.error, color: Colors.white),
                              shouldIconPulse: true,
                              barBlur: 20,
                            );
                          } finally {}
                        },
      
                        icon: Image.asset(
                          'assets/images/google_logo.png',
                          height: .03 * Get.height,
                        ),
                      ),
                    ),
                    if (Platform.isIOS)
                      Container(
                        width: Get.width * 0.26,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.withOpacity(1),
                          ),
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(
                              10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(1),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/apple_logo.png',
                            height: .03 * Get.height,
                          ),
                        ),
                      ),
                    SizedBox(width: 20.0),
      
                    Container(
                      width: Platform.isIOS
                          ? Get.width * 0.26
                          : Get.width * .28,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            59, 87, 157, 1),
                        borderRadius:
                        BorderRadius.circular(
                            10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/facebook_logo.png',
                          height: .03 * Get.height,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
      
      

                    TextButton(
                      onPressed: () {
                        Get.to(() =>  SignInPage());
                      },
                      child:   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não tem conta?',style: TextStyles.instance.textRegular,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        ' Criar conta',
                        style: TextStyles.instance.textLink,
                      )
                    ],
                  ),
      
                ),
      
      
              ]),
      
        ),
      ),
    );
  }
}
