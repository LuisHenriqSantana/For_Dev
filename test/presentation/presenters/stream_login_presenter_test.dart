
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:for_dev/presentation/presenters/stream_login_presenter.dart';
import 'package:for_dev/presentation/protocols/validation.dart';
import 'package:mockito/mockito.dart';





class ValidationSpy extends Mock implements Validation {}


void main(){
  StreamLoginPresenter sut;
  ValidationSpy validation;
  String email;

  PostExpectation mockValidationCall(String field)=>
      when(validation.validate(field:field == null ? anyNamed('field') : field, value: anyNamed('value')));

  void mockValidation({String field, String value}){
    mockValidationCall(field).thenReturn(value);
  }

  setUp((){
     validation = ValidationSpy();
     sut = StreamLoginPresenter(validation: validation);
     email = faker.internet.email();
     mockValidation();

  });

  test('Should call Validation wih correct email', (){

    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });
  test('Should emit email error if validation fails', (){
   mockValidation(value:'error');

    expectLater(sut.emailErrorStream, emits('error'));

    sut.validateEmail(email);
  });
}