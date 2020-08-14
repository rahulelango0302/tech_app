import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticle extends StatefulWidget {
  final String expurl;
  FullArticle({@required this.expurl});

  @override
  _FullArticleState createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tech",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Shots",
              style: TextStyle(color: Color(0xFF508829)),
            ),
            Icon(
              Icons.local_bar,
              color: Color(0xFFE88501),
            ),
            Text(
              "- Article",
              style: TextStyle(color: Colors.yellow.shade200),
            )
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.expurl,
          onWebViewCreated: ((
            WebViewController webViewController,
          ) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
