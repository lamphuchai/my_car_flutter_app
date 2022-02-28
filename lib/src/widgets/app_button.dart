import 'package:flutter/material.dart';

class AppButtonLong extends StatelessWidget {
  const AppButtonLong(
      {Key? key, required this.onPressed, required this.child, this.color})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          minimumSize:
              Size(MediaQuery.of(context).size.width * 1 / 2 - 30, 50)),
      onPressed: onPressed,
      child: child,
    );
  }
}
