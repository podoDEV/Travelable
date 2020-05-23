import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:emergency/domain/repositories/user_repository_type.dart';

class UserRepository implements UserRepositoryType {
  @override
  Future<String> userId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.androidId;
    } else {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
  }
}
