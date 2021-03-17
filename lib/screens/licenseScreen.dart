//CONTRIBUTION - BRANDON 100% CONOR 0%

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//License screen.
class LicenseScreen extends StatelessWidget {
  String text =
      "This application uses trademarks and/or copyrights owned by Paizo Inc., which are used under Paizo's Community Use Policy. We are expressly prohibited from charging you to use or access this content. This application is not published, endorsed, or specifically approved by Paizo Inc. For more information about Paizo's Community Use Policy, please visit paizo.com/communityuse. For more information about Paizo Inc. and Paizo products, please visit paizo.com.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PAIZO COMMUNITY USE"),
        ),
        body: SingleChildScrollView(
            child: Text(
          text,
          style: TextStyle(fontSize: 16),
        )));
  }
}
