import 'package:flutter/material.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/pages/signup/signup_presenter.dart';
import 'package:provider/provider.dart';

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError>(
      stream: presenter.nameErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.string.name,
            icon:
                Icon(Icons.person, color: Theme.of(context).primaryColorLight),
            errorText: snapshot.hasData? snapshot.data.description : null,
          ),
          keyboardType: TextInputType.name,
          onChanged: presenter.validateName,
        );
      },
    );
  }
}
