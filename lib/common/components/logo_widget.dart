import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final double size;
  final Color color;
  final String assetName;
  final BoxFit fit;

  Logo({
    this.size = 290.0,
    this.color = Colors.black,
    this.assetName = 'assets/images/logo.svg',
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
      width: size,
      assetName,
        fit: fit,
    );
  }
}
