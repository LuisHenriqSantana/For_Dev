import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/main/factories/usecases/load_current_account_factory.dart';
import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:for_dev/ui/pages/pages.dart';


SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
    loadCurrentAccount: makeLocalLoadCurrentAccount()
  );
}