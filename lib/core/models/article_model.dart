import 'package:flutter/foundation.dart';
import 'package:news_app/core/models/category_model.dart';

class ArticleModel{
  ArticleModel({
    required this.category,
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.time,
    required this.imageUrl,
});
  CategoryModel category;
  String title;
  String description;
  String author;
  String date;
  String time;
  String imageUrl;


}