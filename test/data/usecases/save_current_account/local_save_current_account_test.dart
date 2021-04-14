import 'package:faker/faker.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/domain_error.dart';
import 'package:for_dev/domain/usecases/save_current_account.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});

  Future<void> save(AccountEntity account) async {
    try {
    await saveSecureCacheStorage.saveSecure(key: 'token', value: account.token);
  } catch(error){
      throw DomainError.unexpected;
    }
    }
}

abstract class SaveSecureCacheStorage {
  Future<void> saveSecure({@required String key, @required String value});
}

class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage {}

void main() {
  LocalSaveCurrentAccount sut;
  SaveSecureCacheStorageSpy saveSecureCacheStorage;
  AccountEntity account;

  setUp((){
     saveSecureCacheStorage = SaveSecureCacheStorageSpy();
     sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
     account = AccountEntity(faker.guid.guid());
  });

  test('Should call SaveSecureCacheStorage with correct values', () async {
    await sut.save(account);

    verify(saveSecureCacheStorage.saveSecure(key: 'token', value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws', () async {
    when (saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value')))
    .thenThrow(Exception());

    final future = sut.save(account);
    
    expect(future, throwsA(DomainError.unexpected));
  });
}