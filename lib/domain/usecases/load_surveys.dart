import 'package:for_dev/domain/entities/entities.dart';

abstract class LoadSurveys {
  Future<List<SurveyEntity>> load();
}