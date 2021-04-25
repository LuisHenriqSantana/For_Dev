import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/protocols/protocols.dart';
import 'package:test/test.dart';

class MinLengthValidation implements FieldValidation{
  final String field;
  final int size;

  MinLengthValidation({this.field, this.size});

  ValidationError validate(String value){
    return ValidationError.invalidField;
  }
}

void main(){
  MinLengthValidation sut;

  setUp((){
    sut = MinLengthValidation(field: 'any_filed', size: 5);

  });
  test('Should return error if value is empty',() {
    final error = sut.validate('');
    expect(error, ValidationError.invalidField);
  });
  test('Should return error if value is null',() {
    expect(sut.validate(null), ValidationError.invalidField);
  });
}