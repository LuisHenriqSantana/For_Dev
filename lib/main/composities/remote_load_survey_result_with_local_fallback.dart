import 'package:for_dev/data/usecases/usecases.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class RemoteLoadSurveyResultWithLocalFallback implements LoadSurveyResult {
  final RemoteLoadSurveyResult remote;
  final LocalLoadSurveyResult local;

  RemoteLoadSurveyResultWithLocalFallback(
      {@required this.remote, @required this.local});

  Future<SurveyResultEntity> loadBySurvey({String surveyId}) async {
    try {
      final surveyResult = await remote.loadBySurvey(surveyId: surveyId);
      await local.save(surveyId: surveyId, surveyResult: surveyResult);
      return surveyResult;
    } catch (error) {
      if (error == DomainError.accessDenied) {
        rethrow;
      }
      await local.validate(surveyId);
      return await local.loadBySurvey(surveyId: surveyId);
    }
  }
}
