import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonConstants {
  static const Color primaryColor = const Color(0xff303056);
  static const Color secondaryColor = const Color(0xff1b1a47);

  static void changeStatusColor() {
    SystemChrome.setSystemUIOverlayStyle(
      new SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: primaryColor,
      ),
    );
  }
}
