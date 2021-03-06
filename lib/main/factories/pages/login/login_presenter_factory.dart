import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:for_dev/ui/pages/login/login_presenter.dart';


LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validation: makeLoginValidation(),
      authentication: makeRemoteAuthentication(),
    saveCurrentAccount: makeLocalSaveCurrentAccount()
  );
}