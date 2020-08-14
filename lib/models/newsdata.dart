import 'package:flutter/cupertino.dart';

class NewsData {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String publishedAt;
  NewsData(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage,
      @required this.content,
      @required this.publishedAt});
}
