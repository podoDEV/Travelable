import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../country/presentation/widgets/separator_widget.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(children: <Widget>[
      _getSettingNavigationBarWidget(context),
      SeparatorWidget(
        height: 11,
        color: Color.fromRGBO(228, 230, 233, 1),
      ),
      Expanded(
          flex: 1,
          child: Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 98),
                  Text(
                    '설정인줄 아랏찌?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ),
                  SizedBox(height: 17),
                  Container(
                    height: 2,
                    width: 192,
                    color: Color.fromRGBO(42, 135, 255, 1),
                  ),
                  SizedBox(height: 48),
                  Text(
                    '개발자들 소개 페이지입니다. 아직 설정할게 없어서..나중에\n설정할 것이 생긴다면 수정하겠습니다. 이 시국에 조금이라도\n여행자들에게 도움이 되길 바라는 마음에서 만든 앱입니다. \n이쁘게 봐주세요',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ),
                  SizedBox(height: 66),
                  Text(
                    'v1.0.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ),
                  SizedBox(height: 13),
                  Text(
                    '방구석팀',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ),
                  SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Container()),
                      _getDeveloper('영P', 'https://naver.com/'),
                      SizedBox(width: 24),
                      _getDeveloper('키', 'https://kijunglee.com/'),
                      SizedBox(width: 24),
                      _getDeveloper('더쿠', 'https://github.com/Duckuism'),
                      SizedBox(width: 24),
                      _getDeveloper('도비', 'https://github.com/junhaesung'),
                      SizedBox(width: 24),
                      _getDeveloper('히밤', 'https://github.com/hb1love'),
                      Expanded(child: Container())
                    ],
                  ),
                ],
              )))
    ]);
  }

  Widget _getDeveloper(String nickname, String link) {
    return Container(
        width: 30,
        child: FlatButton(
          padding: EdgeInsets.zero,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => launch(link, forceSafariVC: false),
          child: Text(
            nickname,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(48, 48, 48, 1)),
          ),
        ));
  }

  Widget _getSettingNavigationBarWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 48,
          child: Container(color: Colors.white),
        ),
        Container(
          height: 59,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                  width: 56,
                  height: 56,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => Navigator.pop(context),
                    child: Image.asset('images/btn_back_gray.png'),
                  )),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    '설정',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(48, 48, 48, 1)),
                  ))),
              SizedBox(
                width: 56,
              )
            ],
          ),
        )
      ],
    );
  }
}
