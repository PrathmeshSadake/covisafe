import 'package:flutter/material.dart';

// Models
import '../models/news.dart';
// Widgets
import '../widgets/news_card.dart';

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
        title: Text(
          'Coronavirus News',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ),
      body: isLoading || news.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => NewsCard(
                    newsItem: news[index],
                  ),
                  itemCount: news.length,
                ),
              ),
            ),
    );
  }
}
