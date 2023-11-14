import 'package:flutter/material.dart';

import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';

class CardItemMenu extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  CardItemMenu({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color.fromRGBO(89, 102, 126, 1.0),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0, left: 2.0, right: 2.0),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [


              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: ColorsApp.instance.onPrimaryContainer,
                      shape: BoxShape.circle
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      imageUrl,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),


              Positioned(
                bottom: 0,

                child: Container(
                  height: 50,
                  width: 138,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                  decoration: BoxDecoration(
                    color: ColorsApp.instance.onSurfaceVariant,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(5))
                  ),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyles.instance.textRegular.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                    ), Text(
                        subtitle,
                        textAlign: TextAlign.left,
                        style: TextStyles.instance.textSmallWhite,
                      ),
                  ],)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



