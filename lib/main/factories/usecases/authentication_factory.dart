import 'package:for_dev/data/usecases/authentication/remote_authentication.dart';
import 'package:for_dev/domain/usecases/usecases.dart';
import 'package:for_dev/main/factories/factories.dart';
Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(httpClient: makeHttpAdapter(), url: makeApiUrl('login')
  );
}