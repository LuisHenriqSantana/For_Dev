import 'package:for_dev/data/cache/cache.dart';
import 'package:for_dev/domain/entities/entities.dart';
import 'package:for_dev/domain/helpers/helpers.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount{
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorage});

  Future<AccountEntity> load() async {
    try{
      final token = await fetchSecureCacheStorage.fetch('token');
      return AccountEntity(token:token);
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
