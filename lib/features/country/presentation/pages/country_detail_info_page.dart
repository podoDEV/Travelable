import 'package:emergency/features/country/domain/entities/tel.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/country.dart';
import '../widgets/separator_widget.dart';

class CountryDetailInfoPage extends StatelessWidget {
  final Country country;

  const CountryDetailInfoPage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 17, right: 17),
            child: Column(children: <Widget>[
              _getCountryDetailPrimaryInfoTelWidget(context, country),
              SizedBox(
                height: 30,
              ),
              SeparatorWidget(
                  height: 2, color: Color.fromRGBO(236, 236, 236, 1)),
              SizedBox(
                height: 30,
              ),
              _getCountryDetailEmbassyInfoWidget(country)
            ]))
      ],
    );
  }

  Widget _getCountryDetailPrimaryInfoTelWidget(
      BuildContext context, Country country) {
    return Container(
        padding: EdgeInsets.only(top: 34, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('주요 기관 전화번호',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(48, 48, 48, 1))),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('국제전화 국가 식별번호',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(48, 48, 48, 1))),
                SizedBox(width: 7),
                Text(country.countryNumber,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(48, 48, 48, 1))),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            _getTelWidgets(country.tels, country.countryNumber),
          ],
        ));
  }

  Widget _getTelWidgets(List<Tel> tels, String countryNumber) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            tels.map((tel) => _getBadgeWidget(tel, countryNumber)).toList());
  }

  Widget _getCountryDetailEmbassyInfoWidget(Country country) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('대사관 정보',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(48, 48, 48, 1)))
            ],
          ),
          SizedBox(height: 30),
          _getCountryDetailEmbassyTelInfoWidget(country),
          SizedBox(height: 30),
          _getCountryDetailEmbassyAddressInfoWidget(country),
          SizedBox(height: 30),
          _getCountryDetailEmbassyEmailInfoWidget(country),
          SizedBox(height: 90),
          _getCountryDetailEmbassyMoreInfoWidget(country),
          SizedBox(height: 50)
        ],
      ),
    );
  }

  Widget _getCountryDetailEmbassyTelInfoWidget(Country country) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 18,
          height: 18,
          child: Image.asset('images/ic_call.png'),
        ),
        SizedBox(width: 12),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('대표 번호',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(116, 116, 116, 1))),
            SizedBox(height: 3),
            Text(country.embassy.representativeNumber,
                maxLines: 3,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(48, 48, 48, 1))),
            SizedBox(height: 17),
            Text('긴급 연락처',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(116, 116, 116, 1))),
            SizedBox(height: 3),
            Text(country.embassy.emergencyNumber,
                maxLines: 3,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(48, 48, 48, 1))),
          ],
        ))
      ],
    );
  }

  Widget _getCountryDetailEmbassyAddressInfoWidget(Country country) {
    return GestureDetector(
        onTap: () {
          MapsLauncher.launchQuery(country.embassy.address);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              child: Image.asset('images/ic_pin_blue.png'),
            ),
            SizedBox(width: 12),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(country.embassy.address,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(48, 48, 48, 1))),
              ],
            ))
          ],
        ));
  }

  Widget _getCountryDetailEmbassyEmailInfoWidget(Country country) {
    return GestureDetector(
        onTap: () async {
          var mailScheme = 'mailto:${country.embassy.email}';
          if (await canLaunch(mailScheme)) {
            await launch(mailScheme);
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              child: Image.asset('images/ic_mail.png'),
            ),
            SizedBox(width: 12),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(country.embassy.email,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(48, 48, 48, 1))),
              ],
            ))
          ],
        ));
  }

  Widget _getCountryDetailEmbassyMoreInfoWidget(Country country) {
    return Container(
        padding: EdgeInsets.only(left: 51, right: 51),
        width: double.infinity,
        height: 56,
        child: OutlineButton(
          textColor: Color.fromRGBO(11, 133, 255, 1),
          color: Colors.white,
          borderSide:
              BorderSide(width: 2, color: Color.fromRGBO(11, 133, 255, 1)),
          child: Text('더 자세한 정보 알아보기',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
          onPressed: () async {
            if (await canLaunch(country.link)) {
              await launch(country.link, forceSafariVC: false);
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        ));
  }

  Widget _getBadgeWidget(Tel tel, String countryNumber) {
    return Container(
        width: 120,
        height: 90,
        child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () async {
              var tellScheme = 'tel:' + tel.callNumber(countryNumber);
              if (await canLaunch(tellScheme)) {
                await launch(tellScheme, forceSafariVC: false);
              }
            },
            child: Column(
              children: <Widget>[
                Container(width: 23, height: 23, child: tel.displayImage()),
                SizedBox(
                  height: 12,
                ),
                Text(tel.displayName(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(11, 133, 255, 1))),
                SizedBox(
                  height: 7,
                ),
                Text(tel.displayNumber(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(48, 48, 48, 1)))
              ],
            )));
  }
}
