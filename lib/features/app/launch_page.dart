import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/FCM.dart';
import '../../core/usecases/usecase.dart';
import '../../injection_container.dart';
import '../country/presentation/pages/list/country_list_page.dart';
import '../member/domain/usecases/login_usecase.dart';

class LaunchPage extends StatefulWidget {
  static const routeName = '/launch';

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
    // initService();
  }

  initService() {
    Future.delayed(
        Duration(seconds: 1),
        () => sl<LoginUseCase>()(NoParams()).then((_) =>
            Navigator.pushReplacementNamed(
                context, CountryListPage.routeName)));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            child: Flexible(
          flex: 1,
          child: Container(
            color: Color.fromRGBO(11, 133, 255, 1),
            child: Center(
                child: Text(
              "travelable",
              style: TextStyle(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  fontSize: 34,
                  fontStyle: FontStyle.normal),
            )),
          ),
        )));
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iosPermission();

    fcm.requestNotificationPermissions(IosNotificationSettings());
    fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  void iosPermission() {
    fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
