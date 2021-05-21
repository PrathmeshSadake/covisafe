import 'package:covisafe/models/news.dart';
import 'package:covisafe/utils/date_formatter.dart';
import 'package:covisafe/utils/format_string.dart';
import 'package:covisafe/utils/styles.dart';
import 'package:covisafe/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News newsItem;

  const NewsCard({this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => UrlLauncher.launchInBrowser(newsItem.url),
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 10, // blur radius
                offset: Offset(0, 1), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: Image.network(
                  newsItem.urlToImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.title,
                      style: Styles.newsTitle,
                    ),
                    Text(
                      newsItem.description,
                      style: Styles.newsDesc,
                    ),
                    Text(
                      StringFormatter.formattedString(
                        newsItem.content,
                      ),
                      style: Styles.newsContent,
                    ),
                    Text(
                      newsItem.source,
                      style: Styles.newsDateSrc,
                    ),
                    Text(
                      DateFormatter.formatter(
                        newsItem.publishedAt,
                      ),
                      style: Styles.newsDateSrc,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
