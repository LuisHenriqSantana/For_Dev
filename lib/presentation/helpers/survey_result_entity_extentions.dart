import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/ui/pages/pages.dart';

extension SurveyResultEntityExtensions on SurveyResultEntity {
  SurveyResultViewModel toViewModel() => SurveyResultViewModel(
    surveyId: surveyId,
    question: question,
    answers: answers.map((answer) => answer.toViewModel()).toList(),
  );
}

extension SurveyAnswerEntityExtensions on SurveyAnswerEntity {
  SurveyAnswerViewModel toViewModel() => SurveyAnswerViewModel(
      image: image,
      answer: answer,
      percent: '$percent',
      isCurrentAnswer: isCurrentAnswer);
}
