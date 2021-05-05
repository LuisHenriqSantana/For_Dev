
import 'package:for_dev/data/usecases/usecases.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/composities/composities.dart';
import 'package:for_dev/main/factories/cache/cache.dart';

import '../factories.dart';

LoadSurveyResult makeRemoteLoadSurveyResult(String surveyId) =>
    RemoteLoadSurveyResult(
      httpClient: makeAuthorizeHttpClientDecorator(),
      url: makeApiUrl('surveys/$surveyId/results'),
    );

LoadSurveyResult makeLocalLoadSurveyResult(String surveyId) =>
    LocalLoadSurveyResult(
      cacheStorage: makeLocalStorageAdapter(),
    );

LoadSurveyResult makeRemoteLoadSurveyResultWithLocalFallback(String surveyId) =>
    RemoteLoadSurveyResultWithLocalFallback(
      remote: makeRemoteLoadSurveyResult(surveyId),
      local: makeLocalLoadSurveyResult(surveyId),
    );
