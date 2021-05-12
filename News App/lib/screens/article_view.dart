import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;

  const ArticleView({this.url});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
      body: Container(
        child: WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
      ),
    );
  }
}
