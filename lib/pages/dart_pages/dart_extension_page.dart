import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/dart_pages/dart_datatype_page.dart';
import 'package:flutter_travel/pages/dart_pages/dart_oop_page.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

import 'dart_asyn_page.dart';
import 'dart_generic_page.dart';
import '../../util/extensions.dart';

class DartExtensionPage extends StatefulWidget {
  @override
  _DartExtensionPageState createState() => _DartExtensionPageState();
}

class _DartExtensionPageState extends State<DartExtensionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Extension 扩展"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("ZL").marginAll(10),
              Text("ZL").marginAll(10),
              Text("ZL").marginAll(10),
            ],
          ),
        ),
      ),
    );
  }
}
