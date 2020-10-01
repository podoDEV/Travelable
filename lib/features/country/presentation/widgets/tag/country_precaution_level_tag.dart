import 'package:flutter/material.dart';

import '../../../domain/entities/precaution_level.dart';

class CountryPrecautionLevelTag extends StatelessWidget {
  final PrecautionLevel level;
  CountryPrecautionLevelTag({this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 13, top: 5, right: 13, bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: PrecautionLevelHelper.borderColor(level)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(8))),
        child: Text(PrecautionLevelHelper.name(level),
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: PrecautionLevelHelper.textColor(level))));
  }
}
