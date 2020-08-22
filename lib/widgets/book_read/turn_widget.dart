import 'dart:ui';

import 'package:flutter/material.dart';

class TurnWidget extends StatefulWidget {

  final String content;

  final Function onLoadPre;

  final Function onLoadNext;

  final TextStyle textStyle;

  final Function onMenuClick;

  const TurnWidget(
      {Key key,
      this.content,
      this.onLoadPre,
      this.onLoadNext,
      this.textStyle,
      this.onMenuClick})
      : super(key: key);

  @override
  _TurnWidgetState createState() => _TurnWidgetState();
}

class _TurnWidgetState extends State<TurnWidget> {
  String _content = "";

  List<String> _historyPages = new List();

  //当前能显示的最大文字个数
  int canShowCount = 0;

  TextPainter _textPainter;

  PageController _pageController = PageController(initialPage: 1);

  List<String> _contens = [""];

  int _count=0;//标记是否真的需要回调

  //获取带样式的文本对象
  TextSpan getTextSpan(String text) {
    return new TextSpan(text: text, style: widget.textStyle);
  }


  //接受内容
  //追加内容返回false
  //计算完毕返回true
  bool load(String text) {
    if (layout(text)) {
      return false;
    }
    int start = 0;
    int end = text.length;
    int mid = (end + start) ~/ 2;

    // 最多循环20次
    for (int i = 0; i < 20; i++) {
      if (layout(text.substring(0, mid))) {
        if (mid <= start || mid >= end) break;
        // 未越界
        start = mid;
        mid = (start + end) ~/ 2;
      } else {
        // 越界
        end = mid;
        mid = (start + end) ~/ 2;
      }
    }
    canShowCount = mid;
    return true;
  }

  /// 计算待绘制文本
  /// 未超出边界返回true
  /// 超出边界返回false
  bool layout(String content) {
    content = content ?? '';
    _textPainter
      ..text = getTextSpan(content)
      ..layout(maxWidth: MediaQuery.of(context).size.width);
    return !didExceed;
  }

  /// 是否超出边界
  bool get didExceed {
    return _textPainter.didExceedMaxLines ||
        _textPainter.size.height >
            MediaQuery.of(context).size.height - kToolbarHeight;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contens.insert(0, "");
    _contens.add("");
    _contens[1] = "";
    _textPainter = new TextPainter(textDirection: TextDirection.ltr);

    _contentSkipToNext();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
            children: _contens.map((data) {
              return Container(
                margin: EdgeInsets.only(
                    top: MediaQueryData.fromWindow(window).padding.top,
                    left: 16,
                    right: 16,
                    bottom: 0),
                padding: EdgeInsets.only(
                    bottom: kToolbarHeight -
                        MediaQueryData.fromWindow(window).padding.top),
                child: Text(
                  _contens[1],
                  style: widget.textStyle,
                ),
              );
            }).toList(),
            onPageChanged: _onPageChanged,
            controller: _pageController),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: kToolbarHeight + MediaQuery.of(context).padding.top),
                child: GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: kToolbarHeight + MediaQuery.of(context).padding.top),
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  },
                ),
              ),
            )
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: kToolbarHeight + MediaQuery.of(context).padding.top),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                widget.onMenuClick();
              },
            ),
          ),
        )
      ],
    );
  }


  //获取上一章节的内容
  void _contentSkipToPre() {
    setState(() {
      if (_historyPages.length <= 1) {
        print("first");
        _count++;
        if(_count==2){
          widget.onLoadPre();
        }
      } else {
        _count=0;
        //有历史
        _contens[1] = _historyPages[_historyPages.length - 2];
        _content = _historyPages[_historyPages.length - 1] + _content;
        _historyPages.removeLast();
      }
    });
  }
  //获取下一页的内容
  void _contentSkipToNext() {
    setState(() {
      if (load(_content)) {
        _contens[1] = _content.substring(0, canShowCount);
        _historyPages.add(_contens[1]);
        _count=0;
        _content = _content.substring(canShowCount);
      } else {
        if (_content != "") {
          _contens[1] = _content;
          _historyPages.add(_contens[1]);
          _content = "";
          _count=0;
        }
        print("last");
        _count++;
        if(_count==2){
          widget.onLoadNext();
        }
      }
    });
  }

  void _onPageChanged(int index) {
    print("index===>" + index.toString());
    if (index == 0) {
      _contentSkipToPre();
      _pageController.jumpToPage(_contens.length - 2);
    } else if (index == _contens.length - 1) {
      _contentSkipToNext();
      _pageController.jumpToPage(1);
    }
  }
}
