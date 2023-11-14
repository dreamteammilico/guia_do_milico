import 'package:flutter/material.dart';
import 'package:guia_do_milico/common/ui/common_view.dart';

class HomePage extends CommonView {
   HomePage({super.key});

  @override
  Widget? getPageBody() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Funcionou"),
          ],
        )
      ],
    );
  }
}
