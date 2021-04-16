import 'package:faker/faker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_dev/infra/cache/cache.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';


class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage{}

void main(){
  LocalStorageAdapter sut;
  FlutterSecureStorageSpy secureStorage;
  String key;
  String value;

  setUp((){
     secureStorage = FlutterSecureStorageSpy();
     sut = LocalStorageAdapter(secureStorage: secureStorage);
     key = faker.lorem.word();
     value = faker.guid.guid();
  });

  group('saveSecure', (){
    void mockSaveSecureError(){
      when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenThrow(Exception());
    }

    test('Should call save secure with correct values', () async {
      await sut.saveSecure(key: key, value: value);

      verify(secureStorage.write(key: key, value: value));
    });

    test('Should throws if save secure throws', () async {
      mockSaveSecureError();
      final future = sut.saveSecure(key: key, value: value);

      expect(future, throwsA(TypeMatcher<Exception>()));
    });
  });

    group('fetchSecure', (){
      void mockFetchSecure(){
        when(secureStorage.read(key: anyNamed('key'))).thenAnswer((_) async => value);
      }
      setUp(() {
        mockFetchSecure();
      });

      test('Should call fetch secure with correct value', () async {
        await sut.fetchSecure(key);

        verify(secureStorage.read(key: key));
      });

      test('Should return correct value on success', () async {
        final fetchedValue = await sut.fetchSecure(key);

        expect(fetchedValue, value);
      });
  });
}