import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'splash.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;

  SplashPage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4Dev'),
      ),
      body: Builder(
        builder: (context){
          presenter.navigateToStream.listen((page){
            if (page?.isNotEmpty == true){
              Get.offAllNamed(page);
            }
          });
          presenter.checkAccount();

          return  Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
