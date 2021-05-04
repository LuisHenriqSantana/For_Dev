import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter{
  final LoadCurrentAccount loadCurrentAccount;
  var _navigateTo = RxString();

  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account?.token == null? '/login' : '/surveys';
    } catch(error){
      _navigateTo.value = '/login';
    }
  }
}