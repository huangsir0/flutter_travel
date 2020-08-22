import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/flutter_pages/animated_switcher_page.dart';
import 'package:flutter_travel/pages/flutter_pages/hclswitcher_page.dart';
import 'package:flutter_travel/pages/flutter_pages/painter_page_first.dart';
import 'package:flutter_travel/pages/flutter_pages/shadermasks_page.dart';
import 'package:flutter_travel/pages/flutter_pages/star_page.dart';
import 'package:flutter_travel/widgets/hcl_switcher.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

import 'dialog_page.dart';
import 'hero_page.dart';
import 'mutiple_textfield_page.dart';

class FlutterHomePage extends StatefulWidget {
  @override
  _FlutterHomePageState createState() => _FlutterHomePageState();
}

class _FlutterHomePageState extends State<FlutterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              common_item(context, "Dialog", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new DialogPage();
                }));
              }),
              common_item(context, "ShaderMask", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new ShaderMasksPage();
                }));
              }),
              common_item(context, "Hero动画", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new HeroPage();
                }));
              }),
              common_item(context, "Painter一", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new PainterPageFirst();
                }));
              }),
              common_item(context, "StarWidget", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new StarPage();
                }));
              }),
              common_item(context, "AnimatedSwitcher", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new AnimatedSwitcherPage();
                }));
              }),
              common_item(context, "CoustomerSwitcher", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new HclSwitcherPage();
                }));
              }),
              common_item(context, "MutipleTextFieldPage", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new MutipleTextFieldPage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
