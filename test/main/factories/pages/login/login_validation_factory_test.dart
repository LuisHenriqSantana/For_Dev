import 'package:for_dev/main/factories/factories.dart';
import 'package:for_dev/validation/validators/validators.dart';
import 'package:test/test.dart';

void main(){
  test('Should return the correct validations', (){
    final validations = makeLoginValidations();
    
    expect(validations, [
      RequiredFieldValidation('email'),
      EmailValidation('email'),
      RequiredFieldValidation('password'),
      MinLengthValidation(field: 'password', size: 3)
    ]);
  });
}