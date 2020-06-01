import 'dart:async';
import 'dart:io';

import 'package:emergency/core/usecases/usecase.dart';
import 'package:emergency/features/member/domain/usecases/login_usecase.dart';
import 'package:emergency/injection_container.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/FCM.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("launch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("로그인 -> 무조건 처음에 한번 요청해야함.", style: TextStyle(color: Colors.white)),
              onPressed: () {
                sl<LoginUseCase>()(NoParams());
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("리스트 화면 이동", style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(context, '/country/list', (_) => false);
                Navigator.popAndPushNamed(context, '/country/list');
              },
            ),
          ],
        ),
      ),
    );
  }
}
