import 'package:flutter/material.dart';
import 'package:for_dev/ui/pages/pages.dart';
import 'package:get/get.dart';

import 'survey_result_presenter_factory.dart';

Widget makeSurveyResultPage() => SurveyResultPage(
    makeGetxSurveyResultPresenter(Get.parameters['survey_id']));
