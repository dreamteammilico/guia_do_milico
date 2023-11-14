import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:guia_do_milico/common/ui/styles/colors_app.dart';
import 'package:guia_do_milico/modules/home/controllers/introduction_controller.dart';
import 'package:guia_do_milico/modules/security/controllers/sign_in_controller.dart';
import 'package:guia_do_milico/modules/security/controllers/user_data_controller.dart';

import '../../../common/ui/helpers/message_bottom_sheet_util.dart';
import '../../../common/ui/styles/text_styles.dart';
import '../../security/models/user.dart';


class DrawerCustom {
  UserDataController controller = Get.find();
  SignInController signInController = Get.find();

  Drawer? getDrawer() {
    late Rx<User> user = User.empty().obs;
    user = controller.user;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(() {
            return UserAccountsDrawerHeader(
              accountName: Text(user.value.name, style: TextStyles.instance.textRegularWhite,),
              accountEmail: Text(user.value.email, style: TextStyles.instance.textSmall2White,),
              currentAccountPicture: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black38,
                      blurRadius: 1,
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  child: CachedNetworkImage(
                    width: 60,
                    height: double.infinity,
                    imageUrl: user.value.photo ?? "https:www.erro.",
                    placeholder: (context, url) =>
                        Center(
                          child: SpinKitRing(
                            size: 30,
                            color: ColorsApp.instance.primary,
                          ),
                        ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundColor:ColorsApp.instance.background,
                      child: Image.asset(
                        "assets/images/capacete.png",
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: ColorsApp.instance.secondaryGradient,
            );
          }),
          ListTile(
            leading: Icon(Icons.person, color: ColorsApp.instance.secondary),
            title: Text('Perfil', style: TextStyles.instance.textRegularWhite.copyWith(color: ColorsApp.instance.secondary),),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: ColorsApp.instance.secondary),
            title: Text('Favoritos', style: TextStyles.instance.textRegularWhite.copyWith(color: ColorsApp.instance.secondary),),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.security, color: ColorsApp.instance.secondary),
            title: Text('Segurança', style: TextStyles.instance.textRegularWhite.copyWith(color: ColorsApp.instance.secondary),),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: ColorsApp.instance.secondary),
            title: Text('Ajustes', style: TextStyles.instance.textRegularWhite.copyWith(color: ColorsApp.instance.secondary),),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: ColorsApp.instance.red),
            title: Text('Logout', style: TextStyles.instance.textRegularWhite.copyWith(color: ColorsApp.instance.red),),
            onTap: () async {
              Get.back();
              MessageUtil.showMessage(
                text: 'Você realmente quer sair do aplicativo?',
                messageType: MessageType.confirmation,
                yesButtonText: 'Sim, sair',
                noButtonText: 'Cancelar',
              ).then((result) async {
                if (result != null && result) {
                  // User clicked 'Yes', perform exit action
                  await signInController.signOut();
                }
              });

            },
          ),
        ],
      ),
    );
  }
}
