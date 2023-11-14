
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';


class NotificationWidget extends GetWidget {
  const NotificationWidget({super.key});




  Widget build(BuildContext context) {

    return badges.Badge(
        badgeContent: Text('2',
          style: TextStyles.instance.textSmallWhite,
        ),
        position: badges.BadgePosition.topEnd(top:-8, end: -2),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: ColorsApp.instance.red,
          padding: EdgeInsets.all(5),
          borderRadius: BorderRadius.circular(4),


          elevation: 2,
        ),
        child:Container(
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent, // Cor de fundo azul
          ),
          child:  Icon(
              FontAwesomeIcons.bell,
              size: 25,
            ),
          ),


    );
  }

}
