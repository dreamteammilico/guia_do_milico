import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/components/title_page_custom.dart';
import 'package:guia_do_milico/common/components/vertical_space.dart';
import 'package:guia_do_milico/common/ui/common_view.dart';
import 'package:guia_do_milico/modules/home/controllers/introduction_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../common/components/common_appbar.dart';
import '../../../common/ui/styles/colors_app.dart';
import '../../../common/ui/styles/text_styles.dart';
import '../../content_search/controllers/search_page_controller.dart';
import '../../content_search/screens/search_page.dart';
import '../components/card_item_menu.dart';
import '../components/card_list_menu.dart';
import '../components/drawer_custom.dart';
import '../components/info_card.dart';
import '../components/news_carrousel.dart';
import '../components/sliver_search_app_bar.dart';

class IntroductionPage extends CommonView<IntroductionController> {

  IntroductionPage({super.key});

  @override
  CommonAppBar? getAppbar({String? title}) {
    return null;
  }

  @override
  Key? customKey() {
    return controller.scaffoldKey;
  }

  @override
  Drawer? getDrawer() {
    var drawer = DrawerCustom();
    return drawer.getDrawer();
  }


  List<CardItemMenu> cardItems = [
    CardItemMenu(
      imageUrl: 'assets/images/documentos_ico.png',
      title: 'Pesquisa de Doc.',
      subtitle: 'Normas & Regulamentos',
      onTap: () {
        Get.find<SearchPageController>().enterPage();
        Get.to(SearchPage());
      },
    ),
    CardItemMenu(
      imageUrl: 'assets/images/hotel_ico.png',
      title: 'Hotéis de Trânsito',
      subtitle: 'Encontre Rápido',
      onTap: () {
        // Handle onTap action
      },
    ),
    CardItemMenu(
      imageUrl: 'assets/images/ginastica_ico.png',
      title: 'Atividade Física',
      subtitle: 'Treinamento Físico',
      onTap: () {

      },
    ),
    CardItemMenu(
      imageUrl: 'assets/images/uniformes_ico.png',
      title: 'Uniformes',
      subtitle: 'Categorias e uso',
      onTap: () {},
    ),
    CardItemMenu(
      imageUrl: 'assets/images/musica_ico.png',
      title: 'Musical',
      subtitle: 'Hinos e Canções',
      onTap: () {},
    ),
    CardItemMenu(
      imageUrl: 'assets/images/carreira_ico.png',
      title: 'Carreira',
      subtitle: 'Hierarquia Militar',
      onTap: () {},
    ),
    CardItemMenu(
      imageUrl: 'assets/images/mapa_ico.png',
      title: 'Navegação',
      subtitle: 'Lançado no terreno',
      onTap: () {},
    ),
    CardItemMenu(
      imageUrl: 'assets/images/parceria_ico.png',
      title: 'Parcerias',
      subtitle: 'Pode confiar!',
      onTap: () {},
    ),
  ];


  @override
  Widget? getPageBody() {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: SliverSearchAppBar(openDrawer: () {
            controller.openDrawer();
          }),
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
              return Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [

                    TitlePageWidget(fontFamily: TextStyles.instance.fontFamily,
                      title: "Comece a navegar",
                      subtitle: "O que deseja fazer?",
                      colorTextSubtitle: ColorsApp.instance.onInverseSurface,
                      fontTitleSize: 18,
                      fontSubtitleSize: 14,),
                    CardList(items: cardItems),
                    VerticalSpace(10),

                    TitlePageWidget(fontFamily: TextStyles.instance.fontFamily,
                      title: "Notícias",
                      subtitle: "O que esta acontecendo no mundo?",
                      colorTextSubtitle: ColorsApp.instance.onInverseSurface,
                      fontTitleSize: 18,
                      fontSubtitleSize: 14,),
                    VerticalSpace(10),

                    const NewsCarousel(),
                    VerticalSpace(10),

                    TitlePageWidget(
                      fontTitleSize: 18,
                      fontSubtitleSize: 14,
                      colorTextSubtitle: ColorsApp.instance.onInverseSurface,
                      title: 'Previsão meteorológica', subtitle:'[ Atualizado em 25 de Janeiro às 23:00hrs ]' ,),
                    VerticalSpace(5),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InfoCard(
                                    title: 'Crepúsculo\nMatutino',
                                    imagePath: 'assets/images/sunrise.png',
                                    info: '6:30 AM',
                                  ),
                                  VerticalSpace(5),
                                  InfoCard(
                                    title: 'Fase\nda Lua',
                                    imagePath: 'assets/images/moon.png',
                                    info: 'Crescente',
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InfoCard(
                                    title: 'Crepúsculo\nVespertino',
                                    imagePath: 'assets/images/sunset.png',
                                    info: '6:00 PM',
                                  ),
                                  SizedBox(height: 5),
                                  InfoCard(
                                    title: 'Temperatura\nUmidade do Ar ',
                                    imagePath: 'assets/images/cloudy.png',
                                    info: '25ºC, 60%',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    VerticalSpace(5),
                    Container(

                      margin: const EdgeInsets.only(
                          top: 0.0, left: 5.0, right: 5.0),
                      child: Card(
                        elevation: 3,
                        color: Color.fromRGBO(89, 102, 126, 1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Text('Locais úteis próximo a você',
                                    textAlign: TextAlign.left,
                                    style: TextStyles.instance.textMediumBold,
                                  ),
                                  VerticalSpace(8),
                                  Row(

                                    children: [
                                      Icon(Icons.location_on,
                                        color: Colors.white, size: 20,),
                                      SizedBox(width: 0),
                                      Obx(() {
                                        return Text(
                                          controller.localizacao.value,
                                          style: TextStyles.instance.textRegularWhite,
                                        );
                                      }),
                                    ],
                                  ),
                                  VerticalSpace(8),


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            Container(
                              width: 600,

                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 5, top: 10, bottom: 10),
                                child: Text('Telefones',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(244, 202, 89, 1),

                                  ),),
                              ),
                            ),
                            Card(
                              color: Color.fromRGBO(89, 102, 126, 1.0),
                              child:
                              SizedBox(
                                child:
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: ListTile(
                                      leading: Icon(Icons.local_police_outlined,
                                        color: Color.fromRGBO(59, 64, 80, 1.0),
                                        size: 40.0,),
                                      title: Text('Policia Militar',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          'Atendimento Emergência Policial',
                                          style: TextStyle(
                                              color: Colors.white)),
                                      trailing: IconButton(
                                        icon: Icon(Icons.phone,
                                            color: Color.fromRGBO(
                                                244, 202, 89, 1), size: 30.0),
                                        onPressed: () {
                                          controller.launchPhoneCall('190');
                                        },
                                      )
                                  ),

                                ),
                              ),


                            ),
                            Card(
                              color: Color.fromRGBO(89, 102, 126, 1.0),
                              child:
                              SizedBox(
                                child:
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: ListTile(
                                      leading: Icon(Icons.fire_truck_outlined,
                                        color: Color.fromRGBO(59, 64, 80, 1.0),
                                        size: 40.0,),
                                      title: Text('Bombeiro Militar',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          'Emergências e Salvamento.',
                                          style: TextStyle(
                                              color: Colors.white)),
                                      trailing: IconButton(
                                        icon: Icon(Icons.phone,
                                            color: Color.fromRGBO(
                                                244, 202, 89, 1), size: 30.0),
                                        onPressed: () {
                                          controller.launchPhoneCall('193');
                                        },
                                      )
                                  ),

                                ),
                              ),


                            ),
                            Card(
                              color: Color.fromRGBO(89, 102, 126, 1.0),
                              child:
                              SizedBox(
                                child:
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: ListTile(
                                      leading: Icon(Icons.health_and_safety,
                                        color: Color.fromRGBO(59, 64, 80, 1.0),
                                        size: 40.0,),
                                      title: Text('SAMU ', style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          'Atendimento Móvel de Urgência',
                                          style: TextStyle(
                                              color: Colors.white)),
                                      trailing: IconButton(
                                        highlightColor: Colors.white,
                                        icon: Icon(Icons.phone,
                                            color: Color.fromRGBO(
                                                244, 202, 89, 1), size: 30.0),
                                        onPressed: () {
                                          controller.launchPhoneCall('192');
                                        },
                                      )
                                  ),

                                ),
                              ),


                            ),
                            Card(
                              color: Color.fromRGBO(89, 102, 126, 1.0),
                              child:
                              SizedBox(
                                child:
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: ListTile(
                                      leading: Icon(Icons.woman,
                                        color: Color.fromRGBO(59, 64, 80, 1.0),
                                        size: 40.0,),
                                      title: Text('Atendimento à Mulher',
                                          style: TextStyle(color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          'Violência contra a mulher',
                                          style: TextStyle(
                                              color: Colors.white)),
                                      trailing: IconButton(
                                        icon: Icon(Icons.phone,
                                            color: Color.fromRGBO(
                                                244, 202, 89, 1), size: 30.0),
                                        onPressed: () {
                                          controller.launchPhoneCall('180');
                                        },
                                      )
                                  ),

                                ),
                              ),


                            ),
                          ],
                        ),

                      ),

                    ),

                    SizedBox(height: 10,),

                  ], // ATE QUI
                ),);
            }, childCount: 1)),

      ],


    );
  }
}
