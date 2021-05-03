import 'package:for_dev/data/usecases/usecases.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/factories/factories.dart';

LoadSurveyResult makeRemoteLoadSurveyResult(String surveyId) => RemoteLoadSurveyResult(
      httpClient: makeAuthorizeHttpClientDecorator(),
      url: makeApiUrl('surveys/$surveyId/results'),
    );