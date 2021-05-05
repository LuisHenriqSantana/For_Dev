import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:for_dev/ui/pages/pages.dart';
import '../../factories.dart';

SurveyResultPresenter makeGetxSurveyResultPresenter(String surveyId) =>
     GetxSurveyResultPresenter(
        loadSurveyResult: makeRemoteLoadSurveyResultWithLocalFallback(surveyId),
        surveyId: surveyId
    );

