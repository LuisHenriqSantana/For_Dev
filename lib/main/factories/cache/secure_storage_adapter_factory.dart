import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_dev/infra/cache/cache.dart';

SecureStorageAdapter makeSecureStorageAdapter() =>
    SecureStorageAdapter(secureStorage: FlutterSecureStorage());
