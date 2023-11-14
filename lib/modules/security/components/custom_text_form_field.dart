import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/modules/security/controllers/login_controller.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';

class CustomTextFormField extends GetWidget<LoginController> {

  late TextEditingController editingController;
  late IconData? icon;
  late String hintText;
  late Widget? sufixIcon;
  late bool isPassword;
  late Function(String?)? onSubmit;
  late AutovalidateMode autovalidateMode;
  late String? Function(String?)? validator;


  CustomTextFormField({
    super.key,
    required this.editingController,
    this.icon,
    this.sufixIcon,
    this.onSubmit,
    required this.hintText,
    required this.isPassword,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
  });


  RxBool isVisible = false.obs;



  @override
  Widget build(BuildContext context) {


    return Obx(() {
      isVisible.value = controller.isPasswordVisible.value;

      return Container(
        child: TextFormField(
          onFieldSubmitted: onSubmit,
          style: TextStyles.instance.textRegularWhite,
          controller: editingController,
          decoration: InputDecoration(
            hintStyle: TextStyles.instance.textRegularHint,
            suffixIcon: isPassword ? buildPasswordIconButton() : sufixIcon,
            prefixIcon: icon != null ? Icon(icon, color: ColorsApp.instance.primary,) : null,
            hintText: hintText,
          ),
          autovalidateMode: autovalidateMode,
          validator: validator,
          obscureText: isPassword ? !isVisible.value : false,
        ),
      );
    });
  }


  Widget buildPasswordIconButton() {
    return IconButton(
      onPressed: () => controller.togglePasswordVisibility(),
      icon: Icon(
        controller.isPasswordVisible.isTrue
            ? Icons.visibility
            : Icons.visibility_off,
        color: ColorsApp.instance.primary,
      ),
    );
  }


}
