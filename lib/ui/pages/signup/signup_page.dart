import 'package:flutter/material.dart';
import 'package:for_dev/ui/components/components.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/mixins/mixins.dart';
import 'package:for_dev/ui/pages/signup/signup_presenter.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

class SignUpPage extends StatelessWidget with KeyboardManager, LoadingManager, UIErrorManager, NavigationManager{
  final SignUpPresenter presenter;

  SignUpPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context){
          handleLoading(context, presenter.isLoadingStream);
          handleMainError(context, presenter.mainErrorStream);
          handleNavigation(presenter.navigateToStream, clear: true);


          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginHeader(),
                  Headline1(text: R.string.addAccount),
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Provider(
                      create: (_) => presenter,
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            NameInput(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: EmailInput(),
                            ),
                            PasswordInput(),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 32),
                              child: PasswordConfirmationInput(),
                            ),
                            SignUpButton(),
                            FlatButton.icon(
                                onPressed: presenter.goToLogin,
                                icon: Icon(Icons.exit_to_app),
                                label: Text(R.string.login)
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}