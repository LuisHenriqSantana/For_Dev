import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class GetxSurveysPresenter implements SurveysPresenter{
  final LoadSurveys loadSurveys;
  final _isLoading = true.obs;
  final _isSessionExpired  = RxBool();
  final _surveys = Rx<List<SurveyViewModel>>();
  final _navigateTo = RxString();

  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<bool> get isSessionExpiredStream => _isSessionExpired.stream;
  Stream<List<SurveyViewModel>> get surveysStream => _surveys.stream;
  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSurveysPresenter({@required this.loadSurveys});

  Future<void> loadData() async {
    try {
      _isLoading.value = true;
      final surveys = await loadSurveys.load();
      _surveys.value = surveys
          .map((survey) =>
          SurveyViewModel(
            id: survey.id,
            question: survey.question,
            date: DateFormat('dd MMM yyyy').format(survey.dateTime),
            didAnswer: survey.didAnswer,
          ))
          .toList();
    }on DomainError{
      _surveys.subject.addError(UIError.unexpected.description);
    } finally {
      _isLoading.value = false;
    }
  }
  void goToSurveyResult(String surveyId){
    _navigateTo.value = '/survey_result/$surveyId';
  }
}