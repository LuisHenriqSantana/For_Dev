import 'package:for_dev/main/builders/builders.dart';
import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/protocols/protocols.dart';
import 'package:for_dev/validation/validators/validators.dart';

Validation makeLoginValidation() {
  return ValidationComposite(makeLoginValidations());
}

List<FieldValidation> makeLoginValidations(){
  return [
    ... ValidationBuilder.field('email').required().email().build(),
    ... ValidationBuilder.field('password').required().build()
  ];
}
