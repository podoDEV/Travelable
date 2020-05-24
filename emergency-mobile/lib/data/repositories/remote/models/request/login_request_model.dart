import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class LoginRequestModel extends RequestMappable {
  final String uuid;
  final String fcmToken;

  LoginRequestModel(this.uuid, this.fcmToken);

  @override
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'fcmToken': fcmToken,
      };
}
