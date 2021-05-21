import 'package:covisafe/models/news.dart';
import 'package:covisafe/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> news = [];
  bool isLoading = false;

  loadNewsData() async {
    setState(() {
      isLoading = true;
    });
    news = await News.getNewsData();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadNewsData();
  }

  @override
  Widget build(BuildContext context) {
    print(news.length);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: isLoading || news.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => NewsCard(
                    newsItem: news[index],
                  ),
                  itemCount: news.length,
                ),
              ));
  }
}
