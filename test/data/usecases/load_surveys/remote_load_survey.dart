import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:for_dev/data/http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class RemoteLoadSurveys {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSurveys({@required this.url, @required this.httpClient});

  Future<void> load() async {
    await httpClient.request(url: url, method: 'get');
  }
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Shou call HttpClient with correct values', () async {
    final url = faker.internet.httpsUrl();
    final httpClient = HttpClientSpy();
    final sut = RemoteLoadSurveys(url: url, httpClient: httpClient);

    await sut.load();

    verify(httpClient.request(url: url, method: 'get'));
  });
}
