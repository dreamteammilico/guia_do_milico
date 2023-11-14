import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';
import 'package:guia_do_milico/modules/security/components/custom_button.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

enum MessageType {
  confirmation,
  information,
}

class MessageUtil {
  static MessageType _messageType = MessageType.information;

  static Future<bool?> showMessage({
    required String text,
    MessageType messageType = MessageType.information,
    String? yesButtonText,
    String? noButtonText,
    String? okButtonText,
  }) async {
    _messageType = messageType;

    return Get.bottomSheet(
        barrierColor: ColorsApp.instance.background.withOpacity(.8),
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: ColorsApp.instance.backgroundInit,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15),bottom: Radius.circular(10), ),
        ),
        SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      _buildBottomSheet(text, yesButtonText, noButtonText, okButtonText),
                    ])))
    );
  }

  static Widget _buildBottomSheet(
      String text,
      String? yesButtonText,
      String? noButtonText,
      String? okButtonText,
      ) {
    IconData icon;
    List<Widget> buttons;

    switch (_messageType) {
      case MessageType.confirmation:
        icon = FontAwesomeIcons.circleQuestion;
        buttons = _buildConfirmationButtons(yesButtonText, noButtonText);
        break;
      case MessageType.information:
        icon = FontAwesomeIcons.circleInfo;
        buttons = [_buildOkButton(okButtonText)];
        break;
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalSpace(15),
          Icon(icon, size: 50, color: ColorsApp.instance.primary),
          VerticalSpace(30),
          Text(
            text,
            style: TextStyles.instance.textRegularWhite,
            textAlign: TextAlign.center,
          ),
          VerticalSpace(35),
          ...buttons,
        ],
      ),
    );
  }

  static List<Widget> _buildConfirmationButtons(
      String? yesButtonText,
      String? noButtonText,
      ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            factorWidth: .4,
            factorHeight: .8,
            onPressed: () {
              Get.back(result: true);
            },
            label: yesButtonText ?? 'Sim',
          ),
          CustomButton(
            negative: true,
            factorWidth: .4,
            factorHeight: .8,

            onPressed: () {
              Get.back(result: false);
            },
          label:noButtonText ?? 'Não',
          ),
        ],
      ),
    ];
  }

  static Widget _buildOkButton(String? okButtonText) {
    return

      CustomButton(
        factorHeight: .8,
        onPressed: () {
          Get.back();        },
        label:okButtonText ?? 'OK',
      );


  }
}
