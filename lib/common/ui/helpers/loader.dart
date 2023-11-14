import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

enum MessageType {
  success,
  error,
  info,
  neutral,
}

class LoadDialog {
  static Dialog? _dialog;

  static void show({String? text = "Carregando..."}) {
    var largura = Get.width;
    var fator = largura > 480
        ? .02
        : largura < 360
            ? .035
            : .038;
    var newLargura = largura * fator;
    Get.dialog(
      barrierColor: ColorsApp.instance.background.withOpacity(.9),

      barrierDismissible: false,
      WillPopScope(onWillPop: () async => false, child:Dialog(
        backgroundColor: ColorsApp.instance.secondary,
        child: Container(
          width: Get.width * .5,
          height: 60,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitRing(
                size: 30,
                color: ColorsApp.instance.primary,
              ),
              SizedBox(width: 20.0),
              Text(
                text!,
                style: TextStyles.instance.textRegularWhite,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )),
    );
  }

  static void showSpin() {
    _dialog = Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
        child: SpinKitRing(
          size: 30,
          color: ColorsApp.instance.primary,
        ),
      ),
    );

    Get.dialog(
      barrierColor: ColorsApp.instance.background.withOpacity(.9),
      barrierDismissible: true,
      WillPopScope(onWillPop: () async => false, child: _dialog!),
    );
  }

  static void hide() {
    Get.back();
  }

  static void showToast(String message, MessageType type,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (type) {
      case MessageType.success:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        icon = Icons.check_circle;
        break;
      case MessageType.error:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        icon = Icons.cancel;
        break;
      case MessageType.info:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        icon = Icons.info;
        break;
      case MessageType.neutral:
        backgroundColor = Colors.black45;
        textColor = Colors.white;
        icon = Icons.info;
        break;
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
