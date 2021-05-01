import 'package:for_dev/data/http/http.dart';
import 'package:for_dev/main/decorators/decorators.dart';
import 'package:for_dev/main/factories/cache/cache.dart';
import 'package:for_dev/main/factories/factories.dart';

HttpClient makeAuthorizeHttpClientDecorator() => AuthorizeHttpClientDecorator(
  decoratee: makeHttpAdapter(),
  fetchSecureCacheStorage: makeSecureStorageAdapter()
);
