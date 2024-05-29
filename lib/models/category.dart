import 'package:flutter/material.dart';

class Category {
  const Category(
      {this.color = Colors.blue, required this.id, required this.title});
  final String title;
  final String id;
  final Color color;
}
