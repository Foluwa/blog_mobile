import 'package:blog_mobile/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loaders {
  static SnackBar messageSnackbar(
      {title, fontSize, min, SnackBarAction onClick, color}) {
    return SnackBar(
      backgroundColor: color ?? Constants.bgColor,
      content: Text(
        '${title ?? 'Opps!! an error occured'}',
        style: TextStyle(fontSize: fontSize ?? 18.0),
      ),
      duration: Duration(minutes: min ?? 1),
      action: onClick,
    );
  }
}
