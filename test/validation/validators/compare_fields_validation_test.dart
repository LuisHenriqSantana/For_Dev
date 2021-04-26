import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(field: 'any_filed', valueToCompare: 'any_value');
  });

  test('Should return error if values are not equal',() {
    expect(sut.validate('wrong_value'), ValidationError.invalidField);
  });

  test('Should return null if values are equal',() {
    expect(sut.validate('any_value'), null);
  });
}