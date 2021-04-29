import 'package:for_dev/data/usecases/usecases.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/factories/factories.dart';

LoadSurveys makeRemoteLoadSurveys() => RemoteLoadSurveys(
      httpClient: makeAuthorizeHttpClientDecorator(),
      url: makeApiUrl('surveys'),
    );
