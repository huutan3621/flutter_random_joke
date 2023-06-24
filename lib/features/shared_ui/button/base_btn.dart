import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final MaterialColor btnColor;
  final Function()? onTap;
  const BaseButton(
      {Key? key, required this.title, required this.btnColor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(color: btnColor),
        child: Center(
          child: Text(
            title ?? "",
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
