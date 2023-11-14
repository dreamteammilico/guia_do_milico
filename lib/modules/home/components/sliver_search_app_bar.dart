import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/modules/home/components/search_bar_custom.dart';

import 'package:flutter/material.dart';
import 'package:guia_do_milico/modules/home/controllers/introduction_controller.dart';
import 'dart:io';
import '../../../common/ui/styles/text_styles.dart';
import 'background_wave.dart';
import 'notification_bell.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {

  VoidCallback openDrawer;

   SliverSearchAppBar({required this.openDrawer});


  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final adjustedShrink = shrinkOffset * 2;
    final snap = adjustedShrink > 60;
    var adjustedShrinkOffset =
    shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset;

    if (Platform.isIOS) {
      offset =  (minExtent - adjustedShrinkOffset) * 0.7;
    } else {
      offset =  (minExtent - adjustedShrinkOffset) * 0.6;
    }
    double topPadding;
    if (Platform.isIOS) {
      topPadding = MediaQuery.of(context).padding.top ;
    } else {
      topPadding = MediaQuery.of(context).padding.top + 30;
    }

    return Stack(
      children: [

              Container(
          height: 260,
          child: ClipPath(
            clipper: BackgroundWaveClipper(),
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: 260,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF4CA59), Color(0xFFFFCC92)],
                    stops: [0.0, 0.51],
                    tileMode: TileMode.clamp,
                  )),
            ),
          ),
        ),

              Positioned(
            top:10,
            left:10,
            child: AnimatedOpacity(
                opacity: snap ? 0 : 1,
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                child: IconButton(icon: Icon(FontAwesomeIcons.barsStaggered), onPressed: openDrawer,))),



        Positioned(
            top:10,
            right:10,
            child: AnimatedOpacity(
                opacity: snap ? 0 : 1,
                duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                child: IconButton(icon: NotificationWidget(), onPressed: ()=>{},))),


        AnimatedOpacity(
          opacity: snap ? 0 : 1,
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          child: Container(
            margin: EdgeInsets.only(left: 26, top: 45),
            child: ListTile(

              title: Text( "Olá, bem vindo ao Guia do Milico",

              style: TextStyle(fontFamily: TextStyles.instance.fontFamily, fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO( 59, 64, 80,1.0), ),
            ),
               subtitle: Text( "A ferramenta que todo militar precisa ter.",
               style: TextStyle(fontFamily: TextStyles.instance.fontFamily, fontSize: 14, color: Color.fromRGBO( 59, 64, 80,1.0), ),
          ),
            ),
          ),
        ),
              Positioned(
          top: topPadding + offset ,
          child: SearchBarCustom(),

          left: 16,
          right: 16,
        ),

      ],
    );
  }

  @override
  double get maxExtent => 230;

  @override
  double get minExtent => 135;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}