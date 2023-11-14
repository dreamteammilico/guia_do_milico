import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/modules/content_search/controllers/search_page_controller.dart';
import 'package:guia_do_milico/modules/content_search/screens/search_page.dart';

import '../../../common/ui/styles/text_styles.dart';

class SearchBarCustom extends StatelessWidget {
  final pink = const Color(0xFFFACCCC);
  final grey = const Color(0xFFF2F2F7);

  SearchBarCustom({Key? key}) : super(key: key);
  final searchControler = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        style: TextStyles.instance.textRegularDark,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: pink,
          focusedBorder: _border(pink),
          border: _border(grey),
          enabledBorder: _border(grey),
          hintStyle: TextStyles.instance.textRegularDark,
          hintText: 'Deixe-me ser o seu guia',
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          prefixIcon:  Icon(
            FontAwesomeIcons.search,
            size: 20,
            color: Colors.grey,
          ),
        ),
        onFieldSubmitted: (value) {
          searchControler.searchTermParamUpdate(value);
          searchControler.search();
          Get.to(SearchPage());
        },
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
