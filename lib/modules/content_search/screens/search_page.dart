import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/components/horizontal_space.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';
import 'package:guia_do_milico/common/ui/common_view.dart';
import 'package:guia_do_milico/modules/content_search/components/skeleton_card_search_files.dart';
import 'package:guia_do_milico/modules/content_search/controllers/search_page_controller.dart';
import 'package:guia_do_milico/modules/security/components/custom_text_form_field.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';

import '../../../common/components/common_appbar.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';
import '../components/custom_card_search_files.dart';

class SearchPage extends CommonView<SearchPageController> {

  SearchPage() : super(titleAppBar: "Pesquisa de Documentos");


  @override
  Widget? getPageBody() {
    return Container(
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextFormField(
              validator: super.controller.validator,
              editingController: controller.searchController,

              sufixIcon: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.searchController.text.trim().isNotEmpty) {
                      controller.searchTermParamUpdate(controller.searchController.text);
                      //controller.byTagParamUpdate(false);
                      controller.search();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorsApp.instance.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.search,
                        color: ColorsApp.instance.background,

                        size: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
              hintText: "Digite um termo para pesquisar...",
              onSubmit: (_) {
                if (controller.searchController.text.trim().isNotEmpty) {
                  controller.searchTermParamUpdate(controller.searchController.text);
                  controller.search();
                }
              },
              isPassword: false,
            ),
          ),

          VerticalSpace(0),
          controller.obx((resultado) {
            if (resultado == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Card(
                    color: ColorsApp.instance.card,
                    margin: const EdgeInsets.symmetric(horizontal: 12),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Explore a nossa base de dados e se surpreenda.',
                            style: TextStyles.instance.textSemiBold,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Digite palavras-chave no campo de busca e encontre rapidamente:',
                            style: TextStyles.instance.textRegularWhite,
                          ),
                          SizedBox(height: 8.0),
                          Wrap(
                            spacing: 8.0,
                            children: [
                              Chip(
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                label: Text('Normas',
                                  style: TextStyles.instance.textSmallDark,
                                ),
                                side:BorderSide(width: 1, color: ColorsApp.instance.background),

                                backgroundColor: ColorsApp.instance.primary.withOpacity(.5),

                              ),
                              Chip(

                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                ),
                                label: Text('Regulamentos',
                                  style: TextStyles.instance.textSmallDark,

                                ),
                                side:BorderSide(width: 1, color: ColorsApp.instance.background),
                                backgroundColor: ColorsApp.instance.primary.withOpacity(.5),

                              ),
                              Chip(
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                label: Text('Documentos',
                                  style: TextStyles.instance.textSmallDark,
                                ),
                                side:BorderSide(width: 1, color: ColorsApp.instance.background),

                                backgroundColor: ColorsApp.instance.primary.withOpacity(.5),

                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Experimente esses termos para encontrar resultados mais abrangentes.',
                            style: TextStyles.instance.textRegularWhite,

                          ),
                          SizedBox(height: 8.0),

                          Text(
                            'Utilize a combinação de termos, para obter um resultado mais específico.',
                            style: TextStyles.instance.textRegularWhite,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );

            }
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exibição do número total de resultados
                  Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    padding: const EdgeInsets.only(bottom: 8.0),
                     child: RichText(
                       text: TextSpan(
                         style: TextStyles.instance.textSmall2White, // Estilo padrão do texto
                         children: [
                           TextSpan(
                             text: 'Total de resultados encontrados: ',
                             style: TextStyles.instance.textSmall.copyWith(fontWeight: FontWeight.bold), // Estilo padrão do texto

                           ),
                           TextSpan(
                             text: '${resultado.length} documentos', // Restante do texto
                           ),
                         ],
                       ),
                     ),



                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: resultado.length,
                      itemBuilder: (context, index) {
                        final result = resultado[index];
                        return CustomCardSearchFiles(
                          result: result,
                          downloadFile: controller.downloadFile,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

          },
            onLoading: SkeletonCard(),
            onEmpty:    Expanded(
              child: Column(
                children: [
                  VerticalSpace(20),

                  Lottie.asset("assets/animations/not_found_search.json"),
                VerticalSpace(20),
                Text(
                  'Desculpe, nenhum resultado encontrado.',
                  style: TextStyles.instance.textMediumBold,
                ),
              ],),
            ),
            onError: (error) =>  Center(
              child: Text('Tivemos um erro, tente novamente.',
                style: TextStyles.instance.textRegular,

              ),
            ),
          )

        ],
      ),
    );
  }
}
