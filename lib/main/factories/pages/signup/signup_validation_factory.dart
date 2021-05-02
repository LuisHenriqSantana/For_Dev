import 'package:for_dev/main/builders/builders.dart';
import 'package:for_dev/main/composities/composities.dart';
import 'package:for_dev/presentation/protocols/protocols.dart';
import 'package:for_dev/validation/protocols/protocols.dart';

Validation makeSignUpValidation() => ValidationComposite(makeSignUpValidations());


List<FieldValidation> makeSignUpValidations(){
  return [
    ... ValidationBuilder.field('name').required().min(3).build(),
    ... ValidationBuilder.field('email').required().email().build(),
    ... ValidationBuilder.field('password').required().min(3).build(),
    ... ValidationBuilder.field('passwordConfirmation').required().sameAs('password').build()
  ];
}
