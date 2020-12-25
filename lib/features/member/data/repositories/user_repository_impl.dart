import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/helpers/FCM.dart';
import '../../../../core/logger.dart';
import '../../../../core/networking/api_provider.dart';
import '../../domain/repositories/user_repository.dart';
import 'remote/models/request/login_request_model.dart';
import 'remote/models/response/login_response_model.dart';
import 'remote/requests/login_request.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiProviderProtocol provider;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String accessToken;

  UserRepositoryImpl(this.provider) {
    loadAccessToken();
    logger.d("exists accessToken : ${accessToken != null}");
  }

  @override
  Future<Either<Failure, void>> login() async {
    if (this.accessToken != null) {
      return Right(null);
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
    logger.d(fcmToken);
    return fcmToken;
  }

  Future<void> loadAccessToken() async {
    accessToken = (await _prefs).getString("accessToken");
  }

  Future<void> saveAccessToken(String accessToken) async {
    (await _prefs).setString("accessToken", accessToken);
  }
}
