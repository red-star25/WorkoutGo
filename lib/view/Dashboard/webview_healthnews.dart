import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewNews extends StatefulWidget {
  String url;
  WebViewNews({@required this.url});
  @override
  _WebViewNewsState createState() => _WebViewNewsState(url: url);
}

class _WebViewNewsState extends State<WebViewNews> {
  final String url;
  _WebViewNewsState({this.url});
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        backgroundColor: const Color(0xff05224F),
        title: const Text("Workout GO"),
      ),
    );
  }
}
