import 'package:faker/faker.dart';
import 'package:for_dev/data/cache/cache.dart';
import 'package:for_dev/data/usecases/load_current_account/load_current_account.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/domain_error.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';


class FetchSecureCacheStorageSpy extends Mock implements FetchSecureCacheStorage{}

void main(){
  LocalLoadCurrentAccount sut;
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  String token;

  PostExpectation mockFetchSecureCall() =>
    when(fetchSecureCacheStorage.fetch(any));


  void mockFetchSecure(){
    mockFetchSecureCall().thenAnswer((_) async => token);
  }
  void mockFetchSecureError(){
    mockFetchSecureCall().thenThrow(Exception());
  }

  setUp((){
     fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
     sut = LocalLoadCurrentAccount(fetchSecureCacheStorage: fetchSecureCacheStorage);
     token = faker.guid.guid();
     mockFetchSecure();

  });
  
  test('Should call FetchSecureCacheStorage with correct value', () async {
    await sut.load();

    verify(fetchSecureCacheStorage.fetch('token'));
  });

  test('Should return an AccountEntity', () async {
    final account = await sut.load();

    expect(account, AccountEntity(token: token));
  });

  test('Should throw UnexpectedError if FetchSecureCacheStorage throws', () async {
    mockFetchSecureError();

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}