import 'package:flutter/material.dart';

class Styles {
  static const firstTextColor = Colors.white;
  static const secondTextColor = Colors.black;

  static const firstBackgroundColor = Colors.black;
  static final secondBackgroundColor = Colors.grey.shade300;

  static const roadsterTextColumn =
      TextStyle(fontSize: 16, color: secondTextColor);

  static const titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: firstTextColor,
  );

  static const openableListTitleStyle =
      TextStyle(color: Styles.secondTextColor, fontSize: 15);

  static final boxDecorationCircular30SecBgColor = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: secondBackgroundColor,
  );
}
