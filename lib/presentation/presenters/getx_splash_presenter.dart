import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter implements SplashPresenter{
  final LoadCurrentAccount loadCurrentAccount;
  var _navigateTo = RxString();

  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount() async {
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = account == null? '/login' : '/surveys';
    } catch(error){
      _navigateTo.value = '/login';
    }
  }
}