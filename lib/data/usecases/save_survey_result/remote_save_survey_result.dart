import 'package:for_dev/data/http/http.dart';
import 'package:meta/meta.dart';

class RemoteSaveSurveyResult {
  final String url;
  final HttpClient httpClient;

  RemoteSaveSurveyResult({@required this.url, @required this.httpClient});

  Future<void> save({String answer}) async {
    await httpClient.request(url: url, method: 'put', body:  {'answer': answer});
  }
}
