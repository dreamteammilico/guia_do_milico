import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:guia_do_milico/modules/news/controllers/news_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';

class NewsCarousel extends GetWidget<NewsController> {
  const NewsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
      ),
      items: controller.newsCarrousel.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5),

                decoration: BoxDecoration(

                border: Border.all(width: 2, color: ColorsApp.instance.secondary),
            borderRadius: BorderRadius.all(Radius.circular(15)),

            ),
            child:Stack(
              children: [
            ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    child: CachedNetworkImage(
                      width: Get.width,
                      height: double.infinity,
                      imageUrl: item.image ??
                          'https://firebasestorage.googleapis.com/v0/b/bookclip-26100.appspot.com/o/assets%2Fimages%2FDo-I-need-a-study-group_post-image-inline.jpg?alt=media&token=70eabd6d-56fd-4502-87b0-018bc93647e4&_gl=1*1jqto7d*_ga*MTk2MTk3OTI4Ny4xNjQwNTM1ODgx*_ga_CW55HF8NVT*MTY5ODU1MDcxNS4xOS4xLjE2OTg1NTA3NTIuMjMuMC4w',
                      placeholder: (context, url) =>
                          Center(
                            child: SpinKitRing(
                              size: 30,
                              color: ColorsApp.instance.primary,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),



                Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 2,left:2, right:2,top: 160.0),
                    decoration: BoxDecoration(

                      color: ColorsApp.instance.background.withOpacity(0.8),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15), topRight: Radius.circular(5))
                    ),
                    child: ListTile(
                      title: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyles.instance.textMediumWhite.copyWith(fontWeight: FontWeight.bold),

                      ),
                      subtitle: Text(
                        item.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyles.instance.textRegularWhite,
                      ),
                    ),
                  ),
              ],
            ));
          },
        );
      }).toList(),
    );
  }
}

