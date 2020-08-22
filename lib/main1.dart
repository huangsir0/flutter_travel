import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/demo_pages/fluro/routers.dart';

import 'main_page.dart';
import 'pages/dart_pages/dart_extension_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DartExtensionPage(),
    );
  }
}
