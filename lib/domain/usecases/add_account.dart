import 'package:equatable/equatable.dart';
import 'package:for_dev/domain/entities/account_entity.dart';

import 'package:meta/meta.dart';

abstract class AddAccount{
  Future<AccountEntity> add(AddAccountParams params);
}

class AddAccountParams extends Equatable{
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  @override
  List get props => [email, password, passwordConfirmation, name];

  AddAccountParams({
  @required this.name,
  @required this.email,
  @required this.password,
  @required this.passwordConfirmation,
});
}