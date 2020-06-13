import 'package:flutter/material.dart';

enum PrecautionLevel {
  none, // 안전
  usual, // practice usual precautions(여행 주의)
  enhanced, // practice enhanced precautions(여행 자제)
  avoidNonessential, // avoid non-essential precautions(철수 권고)
  avoidAll // avoid all travel(여행 금지)
}

class PrecautionLevelHelper {
  static String name(PrecautionLevel level) {
    switch (level) {
      case PrecautionLevel.none:
        return "안전";
      case PrecautionLevel.usual:
        return "여행 주의";
      case PrecautionLevel.enhanced:
        return "여행 자제";
      case PrecautionLevel.avoidNonessential:
        return "철수 권고";
      case PrecautionLevel.avoidAll:
        return "여행 금지";
      default:
        return '';
    }
  }

  static Color textColor(PrecautionLevel level) {
    switch (level) {
      case PrecautionLevel.none:
        return Color.fromRGBO(21, 219, 168, 1);
      case PrecautionLevel.usual:
        return Color.fromRGBO(255, 58, 49, 1);
      case PrecautionLevel.enhanced:
        return Color.fromRGBO(255, 58, 49, 1);
      case PrecautionLevel.avoidNonessential:
        return Color.fromRGBO(255, 58, 49, 1);
      case PrecautionLevel.avoidAll:
        return Color.fromRGBO(255, 58, 49, 1);
      default:
        return Colors.white;
    }
  }

  static Color borderColor(PrecautionLevel level) {
    switch (level) {
      case PrecautionLevel.none:
        return Color.fromRGBO(21, 219, 168, 1);
      case PrecautionLevel.usual:
        return Color.fromRGBO(255, 10, 25, 1);
      case PrecautionLevel.enhanced:
        return Color.fromRGBO(255, 10, 25, 1);
      case PrecautionLevel.avoidNonessential:
        return Color.fromRGBO(255, 10, 25, 1);
      case PrecautionLevel.avoidAll:
        return Color.fromRGBO(255, 10, 25, 1);
      default:
        return Colors.white;
    }
  }
}
