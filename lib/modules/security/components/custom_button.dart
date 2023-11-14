import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/styles/app_styles.dart';
import '../../../common/ui/styles/text_styles.dart';

class CustomButton extends GetWidget {
  final Function onPressed;
  final String label;
  final double factorWidth;
  final double factorHeight;

  final bool negative;

  const CustomButton({super.key, required this.onPressed, required this.label, this.factorWidth = 1, this.factorHeight = 1,  this.negative = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * factorWidth,
      height: (Get.height * 0.07) * factorHeight,
      child: ElevatedButton(

        style: negative ? AppStyles.instance.errorButton : AppStyles.instance.primaryButton,
        onPressed: () async {
          onPressed();
        },
        child: Text(label, style: negative ? TextStyles.instance.textButtonLabelWhite : TextStyles.instance.textButtonLabel),
      ),
    );
  }
}
