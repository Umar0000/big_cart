import 'package:flutter/material.dart';

class CategoriesModel {
  final int id;
  final String title;
  final String imageUrl;
  final Color color;
  final Widget widget;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.color,
    required this.widget,
  });
}
