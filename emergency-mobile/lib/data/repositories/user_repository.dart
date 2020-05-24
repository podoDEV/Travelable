import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:emergency/common/logger.dart';
import 'package:emergency/data/helpers/FCM.dart';
import 'package:emergency/data/repositories/remote/models/request/login_request_model.dart';
import 'package:emergency/data/repositories/remote/models/response/login_response_model.dart';
import 'package:emergency/data/repositories/remote/networking/api_provider.dart';
import 'package:emergency/data/repositories/remote/requests/login_request.dart';
import 'package:emergency/domain/repositories/user_repository_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements UserRepositoryType {
  final ApiProviderProtocol provider;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String accessToken;

  UserRepository(this.provider) {
    loadAccessToken();
    logger.d("exists accessToken : ${accessToken != null}");
  }

  @override
  Future<void> login() async {
    if (this.accessToken != null) {
      return;
    }

    String userId = await getUserId();
    String fcmToken = await getFcmToken();
    final requestModel = LoginRequestModel(userId, fcmToken);

    final response = await provider.send(LoginRequest(requestModel));

    final accessToken = LoginResponseModel.fromMap(response).accessToken;
    this.accessToken = accessToken;
    saveAccessToken(accessToken);
  }

  Future<String> getUserId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }

  Future<String> getFcmToken() async {
    String fcmToken = await fcm.getToken();

    return fcmToken;
  }

  Future<void> loadAccessToken() async {
    accessToken = (await _prefs).getString("accessToken");
  }

  Future<void> saveAccessToken(String accessToken) async {
    (await _prefs).setString("accessToken", accessToken);
  }
}
