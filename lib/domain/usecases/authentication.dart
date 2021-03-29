import 'package:for_dev/domain/entities/account_entity.dart';

import 'package:meta/meta.dart';

abstract class Authentication{
  Future<AccountEntity> auth(AuthenticationParams params);
}

class AuthenticationParams{
  final String email;
  final String secret;

 AuthenticationParams({
  @required this.email,
  @required this.secret,
});
 Map toJson() => {'email': email, 'password': secret};
}