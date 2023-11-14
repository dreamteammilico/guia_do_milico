import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double height;

  VerticalSpace(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
