import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class EGResponseModel<T extends Mappable> {
  T data;

  EGResponseModel({this.data});

  factory EGResponseModel.fromJson(Map<String, dynamic> json) {
    return new EGResponseModel(data: json['data']);
  }
}
