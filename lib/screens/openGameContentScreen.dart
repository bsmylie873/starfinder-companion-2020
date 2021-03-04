import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Open Game Content screen.
class OpenGameContentScreen extends StatelessWidget {
  String text =
      "Except for material designated as Product Identity (see above), the game mechanics of this dragonlash.com website are Open Game Content, as defined in the Open Game License version 1.0a Section 1(d). No portion of this work other than the material designated as Open Game Content may be reproduced in any form without written permission.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open Gaming Content"),
        ),
        body: SingleChildScrollView(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            )));
  }
}
