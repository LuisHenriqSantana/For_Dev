import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/fake_account_factory.dart';

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount{}

void main (){
  GetxSplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;

  PostExpectation mockLoadCurrentAccountCall() => when(loadCurrentAccount.load());

  void mockLoadCurrentAccount({AccountEntity account}){
    mockLoadCurrentAccountCall().thenAnswer((_) async => account);
  }

  void mockLoadCurrentAccountError(){
    mockLoadCurrentAccountCall().thenThrow(Exception());
  }
  setUp((){
     loadCurrentAccount = LoadCurrentAccountSpy();
     sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
     mockLoadCurrentAccount(account: FakeAccountFactory.makeEntity());
  });
  
  test('Should call LoadCurrentAccount', () async {
    await sut.checkAccount(durationInSeconds: 0);

    verify(loadCurrentAccount.load()).called(1);
  });
  
  test('Should go to surveys page on success', () async { 
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/surveys')));
  
    await sut.checkAccount(durationInSeconds: 0);
  });

  test('Should go to login page on null result', () async {
    mockLoadCurrentAccount(account: null);

    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.checkAccount(durationInSeconds: 0);
  });

  test('Should go to login page on null token', () async {
    mockLoadCurrentAccount(account: AccountEntity(token: null));

    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.checkAccount(durationInSeconds: 0);
  });

  test('Should go to login page on error', () async {
    mockLoadCurrentAccountError();

    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/login')));

    await sut.checkAccount(durationInSeconds: 0);
  });
}