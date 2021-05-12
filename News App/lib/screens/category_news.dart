import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/article.dart';
import 'package:newsapp/widgets/blog_tile.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews(this.category);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<Article> articles = new List<Article>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=${widget.category}&apiKey=3b6038187c18427a81c4a8a2a9f9be5a';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      (jsonData['articles']).forEach((element) async {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element != null) {
          articles.add(Article(
              title: element['title'],
              content: element['content'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage']));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          text: 'News',
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: 'App',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
    return Scaffold(
        appBar: appBar,
        body: isLoading
            ? Center(
                child: Container(
                child: CircularProgressIndicator(),
              ))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 1.0,
                        child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url,
                              );
                            },
                            itemCount: articles.length),
                      )
                    ],
                  ),
                ),
              ));
  }
}
