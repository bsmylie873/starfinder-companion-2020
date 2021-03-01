import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//Class to render a webpage.
class WebViewContainer extends StatefulWidget {
  //Url created.
  final url;

  //Url read into the container.
  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  //Private url created, as well as the key for the new constructor.
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                  //Key identifiers instance of web page, javascript is allowed
                  //to run, and url is initialised.
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}