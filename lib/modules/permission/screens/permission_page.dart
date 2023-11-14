import 'package:flutter/material.dart';
import 'package:guia_do_milico/common/components/common_bottom_navigationbarbar.dart';
import 'package:guia_do_milico/common/ui/theme/color_schemes.dart';
import 'package:guia_do_milico/modules/permission/controllers/permission_controller.dart';
import '../../../common/components/common_appbar.dart';
import '../../../common/ui/common_view.dart';

class PermissionPage  extends CommonView<PermissionController> {
  PermissionPage({super.key});


  @override
  CommonAppBar? getAppbar({String? title}) {
    return null;
  }

  @override
  Widget? getPageBody() {
    return Scaffold(
      backgroundColor: lightColorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom:56.0, left: 40, right: 40),
            child: Text(
              'Para utilizar o Google Maps e outros recursos de navegação em nosso aplicativo, é necessário permitir o acesso à sua localização.',

              style: TextStyle(
                color: lightColorScheme.onPrimary,
                fontSize: 15,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () async => await controller.requestLocationPermission(),
            child: Card(
              color: lightColorScheme.secondary,
              elevation: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SizedBox(
                height: 160,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: controller.locationPermission.value.isGranted ? 1.0 : 0.9,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        'assets/images/location.png',
                        height: 60,
                        width: 60,
                        //color: Colors.amber,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      'Localização',
                      style: TextStyle(
                        color: lightColorScheme.onPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    AnimatedOpacity(
                      opacity: controller.locationPermission.value.isGranted ? 0.5 : 1.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Text(
                        '[ Autorizar ]',
                        style: TextStyle(
                          color: lightColorScheme.onPrimary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
