import 'package:for_dev/domain/entities/entities.dart';

abstract class LoadSurveysResult {
  Future<SurveyResultEntity> loadBySurvey({String surveyId});
}