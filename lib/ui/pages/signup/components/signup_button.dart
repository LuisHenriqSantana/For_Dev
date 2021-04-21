import 'package:flutter/material.dart';
import 'package:for_dev/ui/helpers/helpers.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      child: Text(R.string.addAccount.toUpperCase()),
    );
  }
}