import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String btnName;
  final Icon? icon; // can be null
  final Color? bgColor; // can be null
  final TextStyle? textStyle; // can be null
  final VoidCallback? callBack; // can be null

  RoundButton(
      {required this.btnName,
      this.icon,
      this.bgColor = Colors.blue,
      this.textStyle,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                Text(
                  btnName,
                  style: textStyle,
                ),
              ],
            )
          : Text(
              btnName,
              style: textStyle,
            ),
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shadowColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(21),
            bottomLeft: Radius.circular(21),
          ))),
    );
  }
}
