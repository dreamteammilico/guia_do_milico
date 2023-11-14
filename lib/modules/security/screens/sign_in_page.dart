import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/ui/common_view.dart';
import 'package:guia_do_milico/modules/home/screens/introduction_page.dart';
import 'package:guia_do_milico/modules/security/controllers/sign_in_controller.dart';

import '../../../common/components/common_appbar.dart';
import '../../../common/components/title_page_custom.dart';
import '../../../common/components/vertical_space.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class SignInPage extends CommonView<SignInController> {
   SignInPage({super.key});

  @override
  CommonAppBar? getAppbar({String? title}) {
    return null;
  }

  @override
  Widget? getPageBody() {
    return Stack(
      children: [
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
    child: Container(
    height: Get.height,
      padding: const EdgeInsets.all(35.0),
      child: Form(
        key: controller.signInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitlePageWidget(fontFamily: TextStyles.instance.fontFamily, title: 'Cadastre-se', subtitle: 'Preencha o formulário',),
            VerticalSpace(40.0),

              //  if (ConfigAPI.loginWithPassword)
            Column(children: [
              CustomTextFormField(
                editingController: controller.emailController,
                icon: Icons.email_outlined,
                hintText: 'E-mail',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.validator,
                isPassword: false,
              ),
              VerticalSpace(10.0) ,
              CustomTextFormField(
                editingController: controller.passwordController,
                icon: Icons.lock,
                hintText: 'Senha',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.passwordValidator,
                isPassword: true,
              ),
              VerticalSpace(10.0) ,
              CustomTextFormField(
                editingController: controller.retypePasswordController,
                icon: Icons.lock,
                hintText: 'Confirme a Senha',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.retypeValidator,
                isPassword: true,
              ),
              VerticalSpace(10.0) ,
              CustomTextFormField(
                editingController: controller.nameController,
                icon: Icons.person,
                hintText: 'Nome',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.validator,
                isPassword: false,
              ),
              VerticalSpace(10.0) ,
              CustomTextFormField(
                editingController: controller.surnameController,
                icon: Icons.person,
                hintText: 'Sobrenome',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.validator,
                isPassword: false,
              ),
              VerticalSpace(10.0) ,
              CustomTextFormField(
                editingController: controller.phoneNumberController,
                icon: Icons.phone,
                hintText: 'Telefone',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.phoneValidator,
                isPassword: false,
              ),
              VerticalSpace(20.0) ,


              CustomButton(
                onPressed: () async {
                  if (controller.signInFormKey.currentState!.validate()) {
                    try {
                      await controller.signIn();
                      Get.offAll(() => IntroductionPage());
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
                    controller.signInFormKey.currentState!.save();
                  }
                },
                label: 'Criar conta',
              ),
            ],),

    ]),))),



        Positioned(
          top: 40,
          left: 20,
          child: CircleAvatar(
            backgroundColor: ColorsApp.instance.primary,
            child: IconButton(
              icon:  Icon(Icons.close,color: ColorsApp.instance.background),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ],
    );
  }
}
