//flutter
import 'package:flutter/material.dart';

class MainBodyPadding extends StatelessWidget {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Widget? child;
  const MainBodyPadding(
      {super.key, this.left, this.right, this.top, this.bottom, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: left ?? 15,
          right: right ?? 15,
          top: top ?? 15,
          bottom: bottom ?? 15),
      child: child,
    );
  }
}
