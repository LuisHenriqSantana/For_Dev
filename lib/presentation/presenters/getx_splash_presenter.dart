import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/presentation/mixins/mixins.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter extends GetxController with NavigationManager implements SplashPresenter{
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final account = await loadCurrentAccount.load();
      navigateTo = account?.token == null? '/login' : '/surveys';
    } catch(error){
      navigateTo = '/login';
    }
  }
}