import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class GetxSurveyResultPresenter implements SurveyResultPresenter {
  final LoadSurveyResult loadSurveyResult;
  final String surveyId;
  final _isLoading = true.obs;
  final _surveyResult = Rx<SurveyResultViewModel>();

  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<SurveyResultViewModel> get surveyResultStream => _surveyResult.stream;

  GetxSurveyResultPresenter({
    @required this.loadSurveyResult,
    @required this.surveyId,
  });

  Future<void> loadData() async {
    try {
      _isLoading.value = true;
      final surveyResult =
          await loadSurveyResult.loadBySurvey(surveyId: surveyId);
      _surveyResult.value = SurveyResultViewModel(
        surveyId: surveyResult.surveyId,
        question: surveyResult.question,
        answers: surveyResult.answers.map((answer) => SurveyAnswerViewModel(
          image: answer.image,
          answer: answer.answer,
          percent: '${answer.percent}',
          isCurrentAnswer: answer.isCurrentAnswer
        )).toList(),
      );
    } on DomainError {
      _surveyResult.subject.addError(UIError.unexpected.description);
    } finally {
      _isLoading.value = false;
    }
  }
}
