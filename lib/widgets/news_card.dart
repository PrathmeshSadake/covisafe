import 'package:covisafe/models/news.dart';
import 'package:covisafe/utils/date_formatter.dart';
import 'package:covisafe/utils/format_string.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News newsItem;

  const NewsCard({this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            child: Image.network(
              newsItem.urlToImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsItem.description),
                Text(
                  StringFormatter.formattedString(
                    newsItem.content,
                  ),
                ),
                Text(newsItem.source),
                Text(
                  DateFormatter.formatter(
                    newsItem.publishedAt,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
