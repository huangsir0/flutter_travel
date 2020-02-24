import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/dart_pages/dart_datatype_page.dart';
import 'package:flutter_travel/pages/dart_pages/dart_oop_page.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

import 'dart_generic_page.dart';

class DartHomePage extends StatefulWidget {
  @override
  _DartHomePageState createState() => _DartHomePageState();
}

class _DartHomePageState extends State<DartHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart知识体系"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              common_item(context, "常用数据类型", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new DartDataTypePage();
                }));
              }),
              common_item(context, "Dart面向对象", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new DartOOPPage();
                }));
              }),
              common_item(context, "Dart泛型", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new DartGenericPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
