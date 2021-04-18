import 'package:flutter/material.dart';
import 'package:for_dev/utils/strings%20/strings.dart';

class R {
  static Translations string = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = PtBr();
        break;
    }
  }
}