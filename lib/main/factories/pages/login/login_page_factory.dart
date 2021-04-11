import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';

Widget makeLoginPage() {
  return LoginPage(makeLoginPresenter());
}
