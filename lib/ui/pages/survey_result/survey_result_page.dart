import 'package:flutter/material.dart';
import 'package:for_dev/ui/components/components.dart';
import 'package:for_dev/ui/helpers/helpers.dart';
import 'package:for_dev/ui/mixins/mixins.dart';


import '../pages.dart';
import 'components/components.dart';

class SurveyResultPage extends StatelessWidget with LoadingManager, SessionManager{
  final SurveyResultPresenter presenter;

  SurveyResultPage(this.presenter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(R.string.surveys)),
      body: Builder(
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleSessionExpired(presenter.isSessionExpiredStream);
          presenter.loadData();

          return StreamBuilder<SurveyResultViewModel>(
            stream: presenter.surveyResultStream,
            builder: (context, snapshot){

              if (snapshot.hasError) {
                return ReloadScreen(
                  error: snapshot.error,
                  reload: presenter.loadData,
                );
              }
              if (snapshot.hasData) {
                return SurveyResult(viewModel: snapshot.data, onSave: presenter.save);
              }
              return SizedBox(height: 0);
            },
          );
        },
      ),
    );
  }
}
