import 'package:flutter/material.dart';
import 'package:for_dev/ui/helpers/helpers.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.string.confirmPassword,
        icon: Icon(Icons.lock, color: Theme
            .of(context)
            .primaryColorLight),
      ),
      obscureText: true,
    );
  }
}