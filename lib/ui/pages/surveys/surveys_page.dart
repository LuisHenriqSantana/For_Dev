import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_dev/ui/components/components.dart';
import 'package:for_dev/ui/helpers/helpers.dart';

import 'components/components.dart';
import 'survey_viewmodel.dart';
import 'surveys_presenter.dart';

class SurveysPage extends StatelessWidget {
  final SurveysPresenter presenter;

  SurveysPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.surveys),
      ),
      body: Builder(
        builder: (context){
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading == true) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });
          return StreamBuilder<List<SurveyViewModel>>(
            stream: presenter.loadSurveysStream,
            builder: (context, snapshot) {
              if (snapshot.hasError){
                return Column(
                  children: [
                    Text(snapshot.error),
                    RaisedButton(onPressed: presenter.loadData,
                    child: Text(R.string.reload),)
                  ],
                );
              }
              if (snapshot.hasData){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        aspectRatio: 1,
                    ),
                    items: snapshot.data.map((viewModel) => SurveyItem(viewModel)).toList(),
                  ),
                );
              }
              return SizedBox(height: 0,);
            }
          );
        }
      ),
    );
  }
}

