import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../../../common/ui/styles/colors_app.dart';

class SkeletonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Column(

      children: [

    Container(
      width: Get.width,
      child: SkeletonItem(
      child:Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          Expanded(
            child: SkeletonParagraph(
              style: SkeletonParagraphStyle(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10.0, top: 3),

                  lines: 1,

                  spacing: 2,
                  lineStyle: SkeletonLineStyle(
                    randomLength: true,
                    height: 10,
                    borderRadius: BorderRadius.circular(3),
                    maxLength: Get.width / 1.5,
                    minLength: Get.width / 1.8,

                  )),
            ),
          )
        ],
      ),

      ),
    ),


        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(color: ColorsApp.instance.card,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SkeletonItem(
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
                                child: SkeletonParagraph(
                                  style: SkeletonParagraphStyle(
                                      lines: 2,
                                      spacing: 2,
                                      lineStyle: SkeletonLineStyle(
                                        randomLength: true,
                                        height: 12,
                                        width: Get.width,
                                        borderRadius: BorderRadius.circular(3),
                                        minLength: MediaQuery.of(context).size.width / 1.5,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(height: 0,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
                          child: SkeletonParagraph(
                            style: SkeletonParagraphStyle(
                                lines: 15,
                                spacing: 3,
                                lineStyle: SkeletonLineStyle(
                                  randomLength: true,

                                  height: 10,
                                  borderRadius: BorderRadius.circular(3),

                                  minLength: MediaQuery.of(context).size.width / 1.4,
                                )),
                          ),
                        ),
                        Divider(height: 0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(width: 40, height: 40)),
                                  SizedBox(width: 8),
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(width: 40, height: 40)),
                                  SizedBox(width: 8),
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(width: 40, height: 40)),
                                ],
                              ),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 43,
                                    width: 150,
                                    borderRadius: BorderRadius.circular(30)),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
