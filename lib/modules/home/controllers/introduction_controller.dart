import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/location_service.dart';

class IntroductionController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  var localizacao = "Localizando...".obs;

  Future<void> obterLocalizacaoAtual() async {
    try{
      final localize = await LocationService.getCurrentLocation();
        localizacao.value = "${localize.locality}  ${localize.subLocality}";
    } catch (e) {
      print(e);
    }
  }

  void openDrawer() {
    print("a");
    scaffoldKey.currentState?.openDrawer();
  }

  void launchPhoneCall(String tel) async {
    String phoneNumber = 'tel:'+tel; // substitua pelo número que você deseja chamar
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Não foi possível fazer a chamada para $phoneNumber';
    }
  }

  @override
  void onInit() async {
    await obterLocalizacaoAtual();
    super.onInit();
  }
}
