import 'package:covisafe/utils/format_string.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const String API_KEY = 'bca60ca4665a42e3b01d791bca670476';

addResponseToList(var response) {
  if (response.statusCode == 200) {
    final decodedData = convert.jsonDecode(response.body);
    final newsData = decodedData['articles'];
    newsData.forEach(
      (news) => News.newsList.add(
        News(
          title: news['title'],
          description: news['description'],
          url: news['url'],
          urlToImage: news['urlToImage'],
          publishedAt: news['publishedAt'],
          content: StringFormatter.formattedString(news['content']),
          source: news['source']['name'],
        ),
      ),
    );
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

changeUrl(String keyword) async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?q=coronavirus&apiKey=$API_KEY');
  var response = await http.get(url);
  addResponseToList(response);
}

class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String source;

  News({
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
    @required this.source,
  });

  static List<News> newsList = [];

  static Future<List<News>> getNewsData() async {
    await changeUrl('coronavirus');
    await changeUrl('covid');
    return newsList;
  }
}
