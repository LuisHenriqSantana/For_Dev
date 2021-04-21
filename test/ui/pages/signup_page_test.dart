import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:for_dev/ui/helpers/errors/errors.dart';
import 'package:for_dev/ui/pages/login/login.dart';
import 'package:for_dev/ui/pages/signup/signup.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

class LoginPresenterSpy extends Mock implements LoginPresenter {}

void main() {
  LoginPresenter presenter;
  StreamController<UIError> emailErrorController;
  StreamController<UIError> passwordErrorController;
  StreamController<UIError> mainErrorController;
  StreamController<String> navigateToController;
  StreamController<bool> isFormValidController;
  StreamController<bool> isLoadingController;

  void initStreams() {
    emailErrorController = StreamController<UIError>();
    passwordErrorController = StreamController<UIError>();
    mainErrorController = StreamController<UIError>();
    navigateToController = StreamController<String>();
    isFormValidController = StreamController<bool>();
    isLoadingController = StreamController<bool>();
  }

  void mockStreams() {
    when(presenter.emailErrorStream)
        .thenAnswer((_) => emailErrorController.stream);
    when(presenter.passwordErrorStream)
        .thenAnswer((_) => passwordErrorController.stream);
    when(presenter.mainErrorStream)
        .thenAnswer((_) => mainErrorController.stream);
    when(presenter.navigateToStream)
        .thenAnswer((_) => navigateToController.stream);
    when(presenter.isFormValidStream)
        .thenAnswer((_) => isFormValidController.stream);
    when(presenter.isLoadingStream)
        .thenAnswer((_) => isLoadingController.stream);
  }

  void closeStreams() {
    emailErrorController.close();
    passwordErrorController.close();
    mainErrorController.close();
    navigateToController.close();
    isFormValidController.close();
    isLoadingController.close();
  }

  Future<void> loadPage(WidgetTester tester) async {
    presenter = LoginPresenterSpy();
    initStreams();
    mockStreams();
    final signUpPage = GetMaterialApp(
      initialRoute: '/signup',
      getPages: [
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(
            name: '/any_route', page: () => Scaffold(body: Text('fake page'))),
      ],
    );
    await tester.pumpWidget(signUpPage);
  }

  tearDown(() {
    closeStreams();
  });

  testWidgets('Should load with correct initial state', (WidgetTester tester) async {
        await loadPage(tester);

        final nameTextChildren = find.descendant(
            of: find.bySemanticsLabel('Nome'), matching: find.byType(Text));
        expect(
          nameTextChildren,
          findsOneWidget,
        );

        final emailTextChildren = find.descendant(
            of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
        expect(
          emailTextChildren,
          findsOneWidget,
        );

        final passwordTextChildren = find.descendant(
            of: find.bySemanticsLabel('Senha'), matching: find.byType(Text));
        expect(
          passwordTextChildren,
          findsOneWidget,
        );

        final passwordConfirmationTextChildren = find.descendant(
            of: find.bySemanticsLabel('Confirmar senha'), matching: find.byType(Text));
        expect(
          passwordConfirmationTextChildren,
          findsOneWidget,
        );
      });
}