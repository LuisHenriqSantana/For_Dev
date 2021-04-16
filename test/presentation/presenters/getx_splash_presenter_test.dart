import 'package:for_dev/domain/usecases/load_current_account.dart';
import 'package:for_dev/ui/pages/splash/splash.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class GetxSplashPresenter implements SplashPresenter{
  final LoadCurrentAccount loadCurrentAccount;
  var _navigateTo = RxString();

  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount() async {
    await loadCurrentAccount.load();
  }
}

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount{}

void main (){
  GetxSplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;
  setUp((){
     loadCurrentAccount = LoadCurrentAccountSpy();
     sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
  });
  
  test('Should call LoadCurrentAccount', () async {
    await sut.checkAccount();

    verify(loadCurrentAccount.load()).called(1);
  });
}