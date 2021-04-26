import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/protocols/protocols.dart';
import 'package:meta/meta.dart';

class CompareFieldsValidation implements FieldValidation{
  final String field;
  final String fieldToCompare;

  CompareFieldsValidation({@required this.field, @required this.fieldToCompare});

  ValidationError validate(Map input){
    return input[field] == input[fieldToCompare] ? null : ValidationError.invalidField;
  }
}