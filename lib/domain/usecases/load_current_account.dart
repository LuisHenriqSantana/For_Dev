import 'package:for_dev/domain/entities/entities.dart';

abstract class LoadCurrentAccount{
  Future<AccountEntity> load();
}