import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel/util/api.dart';
import 'package:flutter_travel/widgets/book_read/scroll_widget.dart';

class DemoScrollPage extends StatefulWidget {
  @override
  _DemoScrollPageState createState() => _DemoScrollPageState();
}

class _DemoScrollPageState extends State<DemoScrollPage> {
  Api _api = new Api();

  String _content = '';
  double contentFontSize = 17;
  double contentSpace = 1.2;

  //文本展示格式
  TextStyle _textStyle;

  //当前能显示的最大文字个数
  int canShowCount = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textStyle = TextStyle(
        fontSize: contentFontSize,
        letterSpacing: contentSpace,
        height: 1.6,
        fontWeight: FontWeight.w300);

    _api.getBookContent("content").then((value) {
      setState(() {
        _content = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollWidget(
        content: _content,
        onLoadPre: () {
          setState(() {
            _content = _content;
          });
        },
        onLoadNext: () {
          setState(() {
            _content = _content;
          });
        },
        onMenuClick: () {},
        textStyle: _textStyle,
      ),
    );
  }
}
