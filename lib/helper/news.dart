import 'dart:convert';
import 'dart:async';
import 'package:news_api/models/article_model.dart';
import 'package:http/http.dart' as http;

//    var response = await http.get(Uri.parse(url));
class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8a89fb81bf72488187805e533cfd5705";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              content: element["content"]);
          news.add(articleModel);
        }
      });
    }
  }
}
