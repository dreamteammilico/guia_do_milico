import 'package:get/get.dart';

import '../models/news.dart';

class NewsController extends GetxController {

  RxList newsCarrousel = [].obs;

  @override
  void onInit() {
    newsCarrousel.assignAll([
      News(
        image: "https://media.gq.com/photos/62b62ac63908ae365866a3fb/16:9/w_1999,h_1124,c_limit/PRINT%20-SELECTS_Ukraine_foreign_legion_002.jpg",
        title: "Aeronáutica e Mestrado nos EUA.",
        subtitle: "Uma luta contra o mal",
      ),
      News(
        image: "https://i.glbimg.com/og/ig/infoglobo1/f/original/2021/08/11/lula_independencia_2006_domingos_tadeu_pr.png",
        title: "Lula quer paz com os fardados! ",
        subtitle: "Militares não serão importunados pela nova medida",
      ),
      News(
        image: "https://www.mtu.edu/news/2022/12/images/rotc-2-banner1600.jpg",
        title: "Uma notícia qualquer",
        subtitle: "Uma luta contra o mal",
      ),
    ]);

    super.onInit();
  }
}
