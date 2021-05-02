import 'package:for_dev/data/http/http.dart';
import 'package:for_dev/data/models/remote_survey_answer_model.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:meta/meta.dart';

class RemoteSurveyResultModel {
  final String surveyId;
  final String question;
  final List<RemoteSurveyAnswerModel> answers;

  RemoteSurveyResultModel({
    @required this.surveyId,
    @required this.question,
    @required this.answers,
  });

  factory RemoteSurveyResultModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['surveyId', 'question', 'answers'])) {
      throw HttpError.invalidData;
    }
    return RemoteSurveyResultModel(
      surveyId: json['surveyId'],
      question: json['question'],
      answers: json['answers'].map<RemoteSurveyAnswerModel>((answerJson) => RemoteSurveyAnswerModel.fromJson(answerJson)).toList(),
    );
  }

  SurveyResultEntity toEntity() => SurveyResultEntity(
    surveyId: surveyId,
    question: question,
    answers: answers.map<SurveyAnswerEntity>((answer) => answer.toEntity()).toList(),
  );
}
