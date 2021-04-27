import 'package:for_dev/data/usecases/usecases.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/factories/factories.dart';

AddAccount makeRemoteAddAccount() {
  return RemoteAddAccount(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('signup'),
  );
}
