import 'package:big_cart/models/cataories_model/cat_model_one/data.dart';

class CategoriesModelOne {
  String? message;
  int? statusCode;
  Data? data;

  CategoriesModelOne({this.message, this.statusCode, this.data});

  CategoriesModelOne.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
