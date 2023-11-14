import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/modules/security/screens/login_page.dart';
import 'package:guia_do_milico/modules/security/services/auth_service.dart';

import '../ui/styles/colors_app.dart';
import '../ui/styles/text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  String? title;
  List<Widget>? actions;

  CommonAppBar({super.key, this.title, this.actions });



  final authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
        toolbarHeight: 90,
      elevation: 1,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title!,
              style: TextStyles.instance.textTitleAppbar,
            ),
          ),
        ],
      ),

      flexibleSpace: Container(
        height: 80,
        decoration: ColorsApp.instance.primaryGradient,
      ),
    );



  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// class CommonAppBar extends AppBar {

//   @override
//   Widget build(BuildContext context) {
//     return AppBar();
//   }
// }
