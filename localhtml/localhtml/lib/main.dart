import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Webview demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WebViewController _webViewController;
  String filePath='files/test.html';

      _loadHtmlFromAssets() async{
      String fileHtmlContents = await rootBundle.loadString(filePath);
      _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
      .toString());
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: WebView(

        initialUrl: 'file:///android_asset/flutter_assets/assets/test.html',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
       floatingActionButton: FloatingActionButton(
         child: const Icon(Icons.add),
         onPressed: () {
           
         },
         ),
    );

  }
}
