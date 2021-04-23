import 'package:flutter/material.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/pages/signup/signup_presenter.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError>(
        stream: presenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: R.string.password,
              icon:
                  Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
              errorText: snapshot.hasData? snapshot.data.description : null,
            ),
            obscureText: true,
            onChanged: presenter.validatePassword,
          );
        });
  }
}
