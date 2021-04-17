import 'package:flutter/material.dart';
import 'package:for_dev/ui/pages/pages.dart';

import '../pages.dart';

Widget makeSplashPage() {
  return SplashPage(presenter: makeGetxSplashPresenter());
}
