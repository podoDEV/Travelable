import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../core/error/exceptions.dart';
import '../../core/helpers/FCM.dart';
import '../../core/logger.dart';
import '../../core/usecases/usecase.dart';
import '../../injection_container.dart';
import '../country/presentation/bloc/country_bloc.dart';
import '../member/domain/usecases/login_usecase.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = fcm.onIosSettingsRegistered.listen((data) {
        // save the token
      });

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
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      try {
        await sl<LoginUseCase>()(NoParams());
        Navigator.popAndPushNamed(context, '/country/list');
      } on ServerException {
        logger.e(SERVER_FAILURE_MESSAGE);
      }
    });
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
}
