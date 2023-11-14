import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double width;

  HorizontalSpace(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
