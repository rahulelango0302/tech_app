import 'dart:convert';

import 'package:tech_app/models/newsdata.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsData> newsdetails = [];
  Future<void> getnews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=APIKEY";
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsData NewsArticle = NewsData(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url'],
              content: element['content'],
              publishedAt: element['publishedAt']);
          newsdetails.add(NewsArticle);
        }
      });
    }
  }
}
