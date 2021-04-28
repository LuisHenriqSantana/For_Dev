import 'package:for_dev/ui/pages/pages.dart';

abstract class SurveysPresenter{
  Stream<bool> get isLoadingStream;
  Stream<List<SurveyViewModel>> get loadSurveysStream;

  Future<void> loadData();
}