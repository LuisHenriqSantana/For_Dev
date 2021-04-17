import 'package:for_dev/data/usecases/load_current_account/load_current_account.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/factories/cache/cache.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(fetchSecureCacheStorage: makeLocalStorageAdapter()
  );
}