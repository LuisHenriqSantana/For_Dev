import 'package:flutter/material.dart';
import 'strings/pt_br.dart';
import 'strings/translations.dart';

class R {
  static Translation string = PtBr();

  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = PtBr();
        break;
    }
  }
}