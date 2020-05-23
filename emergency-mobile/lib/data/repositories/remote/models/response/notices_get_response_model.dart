import 'package:emergency/domain/entities/notice.dart';

class NoticesGetResponseModel {
  List<Notice> notices;

  NoticesGetResponseModel({this.notices});

  factory NoticesGetResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    return new NoticesGetResponseModel(
        notices: list.map((e) => Notice.fromJson(e)).toList());
  }
}
