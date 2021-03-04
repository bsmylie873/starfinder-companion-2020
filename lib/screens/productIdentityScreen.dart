import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Product Identity Content screen.
class ProductIdentityScreen extends StatelessWidget {
  String text =
      "The following items are hereby identified as Product Identity, as defined in the Open Game License 1.0a, Section 1(e), and are not Open Content: All trademarks, registered trademarks, proper names (characters, deities, etc.), dialogue, plots, storylines, locations, characters, artworks, and trade dress. (Elements that have previously been designated as Open Game Content are not included in this declaration.)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Identity"),
        ),
        body: SingleChildScrollView(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            )));
  }
}
