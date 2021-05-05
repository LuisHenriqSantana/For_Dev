import 'package:faker/faker.dart';
import 'package:for_dev/data/usecases/usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class RemoteLoadSurveyResultWithLocalFallback{
  final RemoteLoadSurveyResult remote;

  RemoteLoadSurveyResultWithLocalFallback({@required this.remote});

  Future<void> loadBySurvey({String surveyId}) async{
    await remote.loadBySurvey(surveyId: surveyId);
  }
}

class RemoteLoadSurveyResultSpy extends Mock implements RemoteLoadSurveyResult{}

void main(){
  test('Shoul call remote LoadBySurvey', ()async{
    final surveyId = faker.guid.guid();
    final remote = RemoteLoadSurveyResultSpy();
    final sut = RemoteLoadSurveyResultWithLocalFallback(remote: remote);

    await sut.loadBySurvey(surveyId: surveyId);

    verify(remote.loadBySurvey(surveyId: surveyId)).called(1);
  });
}