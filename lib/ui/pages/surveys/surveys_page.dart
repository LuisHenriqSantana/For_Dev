

import 'package:for_dev/ui/components/components.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/mixins/mixins.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages.dart';
import 'components/survey_items.dart';

class SurveysPage extends StatelessWidget with LoadingManager, NavigationManager, SessionManager{
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.surveys),
      ),
      body: Builder(builder: (context) {
        handleLoading(context, presenter.isLoadingStream);
        handleSessionExpired(presenter.isSessionExpiredStream);
        handleNavigation(presenter.navigateToStream);
        presenter.loadData();

        return StreamBuilder<List<SurveyViewModel>>(
            stream: presenter.surveysStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ReloadScreen(
                  error: snapshot.error,
                  reload: presenter.loadData,
                );
              }
              if (snapshot.hasData) {
                return Provider(
                    create: (_) => presenter,
                    child: SurveyItems(snapshot.data));
              }
              return SizedBox(height: 0);
            });
      }),
    );
  }
}
