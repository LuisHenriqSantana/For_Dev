import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:for_dev/ui/pages/signup/signup.dart';
import '../../factories.dart';

SignUpPresenter makeGetxSignUpPresenter() => GetxSignUpPresenter(
      addAccount: makeRemoteAddAccount(),
      validation: makeSignUpValidation(),
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );