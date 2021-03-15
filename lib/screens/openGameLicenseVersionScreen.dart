//CONTRIBUTION - BRANDON 100% CONOR 0%

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//Open Game Content screen.
class OpenGameLicenseVersion extends StatelessWidget {
  //Path variable created.
  final String path = "data/license";
  //Future method to load data with path parameter.
  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open Gaming License"),
        ),
        body: FutureBuilder(
          future: getFileData(path),
            builder: (context, snapshot) {
            //Data displayed.
              return SingleChildScrollView(
                  child: Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 16),
                  )
              );
            }
        )
    );
  }
}
