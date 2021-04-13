import 'package:for_dev/domain/entities/entities.dart';

abstract class SaveCurrentAccount{
  Future<void> save(AccountEntity account);
}