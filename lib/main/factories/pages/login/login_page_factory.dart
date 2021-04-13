import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:for_dev/ui/pages/login/login_presenter.dart';
import 'package:get/get.dart';

Widget makeLoginPage() {
  final presenter = Get.put<LoginPresenter>(makeGetxLoginPresenter());
  return LoginPage(presenter);
}
