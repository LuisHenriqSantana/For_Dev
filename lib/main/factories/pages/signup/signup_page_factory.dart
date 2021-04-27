import 'package:for_dev/main/factories/factories.dart';
import 'package:flutter/material.dart';
import 'package:for_dev/ui/pages/signup/signup.dart';

Widget makeSignUpPage() {
  return SignUpPage(makeGetxSignUpPresenter());
}
