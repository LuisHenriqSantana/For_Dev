import 'package:faker/faker.dart';
import 'package:for_dev/data/http/http_client.dart';
import 'package:for_dev/data/http/http_error.dart';
import 'package:for_dev/data/usecases/remote_authentication.dart';
import 'package:for_dev/domain/helpers/domain_error.dart';
import 'package:for_dev/domain/usecases/authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;
  AuthenticationParams params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
     params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
  });
  test('Should  throw UnexpectedError if HttpClient returns 400', () async {
    when(httpClient.request(url:anyNamed('url'), method: anyNamed('method'), body: anyNamed('body ')))
    .thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
