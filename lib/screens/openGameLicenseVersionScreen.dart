import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Open Game Content screen.
class OpenGameLicenseVersion extends StatelessWidget {
  String text = "http://www.opengamingfoundation.org/ogl.html";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open Gaming License"),
        ),
        body: SingleChildScrollView(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            )));
  }
}
