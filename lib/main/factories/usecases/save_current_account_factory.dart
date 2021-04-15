import 'package:for_dev/data/usecases/save_current_account/local_save_current_account.dart';
import 'package:for_dev/domain/usecases/save_current_account.dart';
import 'package:for_dev/main/factories/cache/cache.dart';
SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(saveSecureCacheStorage: makeLocalStorageAdapter()
  );
}