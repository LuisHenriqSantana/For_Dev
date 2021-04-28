import 'package:for_dev/data/http/http_error.dart';
import 'package:for_dev/domain/entities/account_entity.dart';
import 'package:meta/meta.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel({@required this.accessToken});

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) {
      throw HttpError.invalidData;
    }
    return RemoteAccountModel(accessToken: json['accessToken']);
  }
  AccountEntity toEntity() => AccountEntity(token: accessToken);
}
