import 'package:flutter/material.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';

import '../../../common/ui/styles/text_styles.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String info;

  const InfoCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      child: Card(
        color: Color.fromRGBO(89, 102, 126, 1.0),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [

              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(imagePath),
              ),
              VerticalSpace(10),
              Text(
                title,
                style: TextStyles.instance.textRegularWhite.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              VerticalSpace(10),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color.fromRGBO( 59, 64, 80,1.0),
                ),
                child: Text(
                  info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}