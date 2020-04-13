import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/demo_pages/demo_biquge_page.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

class DemoHomePage extends StatefulWidget {
  @override
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              common_item(context, "笔趣阁爬虫", () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new DemoBiqugePage();
                }));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
