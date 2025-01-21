import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? buttonText;
  const CommonElevatedButton({
    super.key,
    @required this.onPressed,
    @required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonText ?? ""));
  }
}
