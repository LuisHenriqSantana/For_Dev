import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/protocols/protocols.dart';
import 'package:meta/meta.dart';

class MinLengthValidation implements FieldValidation{
  final String field;
  final int size;

  MinLengthValidation({@required this.field, @required this.size});

  ValidationError validate(String value){
    return value != null && value.length >= size ? null : ValidationError.invalidField;
  }
}