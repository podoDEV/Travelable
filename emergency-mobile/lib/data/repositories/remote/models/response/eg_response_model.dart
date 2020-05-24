import 'package:emergency/data/repositories/remote/networking/mappable.dart';

class EGResponseModel<T> {
  T data;

  EGResponseModel({this.data});

  factory EGResponseModel.fromMap(Map<String, dynamic> map) {
    return new EGResponseModel(data: map['data']);
  }
}
