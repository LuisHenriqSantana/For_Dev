import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(field: 'any_filed', valueToCompare: '');
  });
  test('Should return error if value is empty',() {
    expect(sut.validate('wrong_value'), ValidationError.invalidField);
  });
}