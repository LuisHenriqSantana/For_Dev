import 'package:for_dev/presentation/presenters/presenters.dart';
import 'package:for_dev/ui/pages/pages.dart';

import '../../factories.dart';

SurveysPresenter makeGetxSurveysPresenter() =>
    GetxSurveysPresenter(loadSurveys: makeRemoteLoadSurveysWithLocalFallback(),
    );
