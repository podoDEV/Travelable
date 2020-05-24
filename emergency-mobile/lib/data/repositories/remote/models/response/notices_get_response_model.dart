import 'package:emergency/domain/entities/notice.dart';

class NoticesGetResponseModel {
  List<Notice> notices;

  NoticesGetResponseModel({this.notices});

  factory NoticesGetResponseModel.fromMap(Map<String, dynamic> map) {
    var list = map['data'] as List;
    return new NoticesGetResponseModel(
        notices: list.map((e) => Notice.fromMap(e)).toList());
  }
}
