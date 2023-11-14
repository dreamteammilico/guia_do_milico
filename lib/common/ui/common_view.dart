  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:guia_do_milico/common/components/common_appbar.dart';
  import 'package:guia_do_milico/common/components/common_bottom_navigationbarbar.dart';
  import 'package:guia_do_milico/common/ui/styles/colors_app.dart';

  abstract class CommonView<T extends GetxController> extends GetView<T>
      implements CommonViewInterface {

    final String? titleAppBar;
    const CommonView({super.key, this.titleAppBar});


    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          key: customKey(),
          backgroundColor: getColorBackground(),
          appBar: getAppbar(title: titleAppBar),
          body: getPageBody(),
          bottomNavigationBar: getBottomNavigationBar(),
          drawer: getDrawer(),
          endDrawer: getEndDrawer(),
          bottomSheet: getBottomSheet(),
          persistentFooterButtons: getPersistentFooterButtons(),
          floatingActionButton: getFloatingActionButton(),
          floatingActionButtonAnimator: getFloatingActionButtonAnimator(),
        ),
      );
    }

    Key? customKey(){
      return key;
    }


    CommonAppBar? getAppbar({String? title = "Guia do Milico"}) {
      return CommonAppBar(title: title);
    }

    Color? getColorBackground(){
      return ColorsApp.instance.backgroundInit;
    }

    CommonBottomNavigationBar? getBottomNavigationBar() {
      // return const CommonBottomNavigationBar();
      return null;
    }

    Drawer? getDrawer() {
      return null;
    }

    Drawer? getEndDrawer() {
      return null;
    }

    Widget? getBottomSheet() {
      return null;
    }

    List<Widget>? getPersistentFooterButtons() {
      return null;
    }

    FloatingActionButton? getFloatingActionButton() {
      return null;
    }

    FloatingActionButtonAnimator? getFloatingActionButtonAnimator() {
      return null;
    }
  }

  abstract class CommonViewInterface {
    Widget? getPageBody();
  }
