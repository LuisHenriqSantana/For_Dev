import 'package:for_dev/data/http/http.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:meta/meta.dart';

class LocalSurveyModel {
  final String id;
  final String question;
  final DateTime date;
  final bool didAnswer;

  LocalSurveyModel({
    @required this.id,
    @required this.question,
    @required this.date,
    @required this.didAnswer,
  });

  factory LocalSurveyModel.fromJson(Map json) {
    if(!json.keys.toSet().containsAll(['id', 'question', 'date', 'didAnswer'])){
      throw HttpError.invalidData;
    }
    return LocalSurveyModel(
      id: json['id'],
      question: json['question'],
      date: DateTime.parse(json['date']),
      didAnswer: bool.fromEnvironment(json['didAnswer']),
    );
  }
  SurveyEntity toEntity() => SurveyEntity(
    id: id,
    question: question,
    dateTime: date,
    didAnswer: didAnswer,
  );
}