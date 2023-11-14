import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';

import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';

class CustomCardSearchFiles extends StatelessWidget {
  final Map<String, dynamic> result;
  final Function(String, String, BuildContext) downloadFile;

  const CustomCardSearchFiles({
    Key? key,
    required this.result,
    required this.downloadFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.instance.card,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
      //  padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${result["name"]}",
                style:  TextStyles.instance.textRegular.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(color: ColorsApp.instance.background.withOpacity(.4),),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                "${result["snippet"]}...",
                textStyle: TextStyles.instance.textRegularWhite,
                customStylesBuilder: (element) {
                  if (element.localName == 'strong') {
                    return { 'background-color': '#00639B'}; // Substitua '#FF0000' pela cor desejada
                  }
                  return null;
                },
              ),
            )
           ,

            Divider(color: ColorsApp.instance.background.withOpacity(.4), height: 0,),
            Padding(
              padding: const EdgeInsets.all(8),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Lógica para favoritar
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: ColorsApp.instance.background.withOpacity(.5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para like
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: ColorsApp.instance.background.withOpacity(.5),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para deslike
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: ColorsApp.instance.background.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                TextButton.icon(

                      label: Text('Visualizar arquivo', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyles.instance.textSmallDark,),
                      onPressed: () async {
                        downloadFile(result["idDocument"], result["name"], Get.context!);
                      },
                  style: TextButton.styleFrom(
                      backgroundColor: ColorsApp.instance.primary,
                  ),
                      icon: Icon(
                        FontAwesomeIcons.solidFilePdf, // Ícone de PDF
                        color: ColorsApp.instance.background,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


