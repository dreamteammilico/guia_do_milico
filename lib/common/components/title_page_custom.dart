import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';

import '../ui/styles/colors_app.dart';

class TitlePageWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  VoidCallback? onPressed;
  String? titleAbout;
  double? vspace;
  dynamic icon;
  dynamic? fontFamily;
  dynamic colorTextTitle;
  dynamic colorTextSubtitle;
  dynamic colorShadow;
  double? fontTitleSize;
  double? fontSubtitleSize;
  dynamic aligment;
   TitlePageWidget({Key? key, this.fontFamily,this.vspace, required this.title, this.fontTitleSize, this.fontSubtitleSize, this.subtitle, this.onPressed, this.titleAbout, this.aligment, this.icon, this.colorTextTitle, this.colorTextSubtitle,this.colorShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        width: MediaQuery.of(context).size.width,

              margin: EdgeInsets.only(top: 2.5, left: 8, right: 18, bottom: 4),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(
                  this.title.tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: fontTitleSize ??  25,
                    height: 0,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.bold,
                    color: colorTextTitle ?? ColorsApp.instance.primary,
                    shadows: [
                      BoxShadow(
                        color: colorShadow ?? ColorsApp.instance.onSecondaryContainer,
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),),
                onPressed != null ? GestureDetector( onTap: onPressed,
                    child:Row(crossAxisAlignment:CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: colorTextSubtitle ?? Colors.grey, size: 15,), SizedBox(width: 5,), Text(
                  (titleAbout ?? "VER MAIS").toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 12,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    color: colorShadow ?? ColorsApp.instance.secondary,
                    shadows: [
                      BoxShadow(
                        color: colorShadow ?? ColorsApp.instance.onSecondaryContainer,
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                )],))
                : Container()





              ],
            ),


                VerticalSpace(vspace ?? 5),

            this.subtitle != null
                ? Text(
                    this.subtitle!,
                    textAlign: aligment ?? TextAlign.left,
                    style: TextStyle(
                      fontSize: fontSubtitleSize ?? 20,
                      fontFamily: fontFamily,
                      shadows: [
                        BoxShadow(
                          color: colorShadow ?? ColorsApp.instance.onSecondaryContainer,
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset(1, 1),
                        ),
                      ],
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: colorTextSubtitle ?? ColorsApp.instance.secondary,

                    ),
                  )
                : Container(),
            SizedBox(
              height: 0,
            ),
          ],
        ));
  }
}
