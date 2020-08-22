import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/demo_pages/demo_biquge_page.dart';
import 'package:flutter_travel/util/api.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

class DemoBookPage extends StatefulWidget {
  @override
  _DemoBookPageState createState() => _DemoBookPageState();
}

class _DemoBookPageState extends State<DemoBookPage> {
  Api _api = new Api();

  String _content = '';
  double contentFontSize = 17;
  double contentSpace = 1.2;

  int times = 0;

  List<String> pages = new List();

  //文字格式
  TextStyle _textStyle;

  int length = 0;

  TextPainter _textPainter;

  //获取带样式的文本对象
  TextSpan getTextSpan(String text) {
    return new TextSpan(text: text, style: _textStyle);
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
    length = mid;
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
            MediaQuery.of(context).size.height -
                kToolbarHeight ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textPainter = new TextPainter(textDirection: TextDirection.ltr);

    _textStyle = TextStyle(
        fontSize: contentFontSize,
        letterSpacing: contentSpace,
        height: 1.6,
        fontWeight: FontWeight.w300);

    _api.getBookContent("content").then((value) {
      _content = value;
      if (load(value)) {
        print("=====>" + length.toString());
        print("=====>" + value.length.toString());
        print("=====>" + (value.length / length).ceil().toString());
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分页"),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          //执行缩放动画
          return SlideTransitionX(
            child: child,
            direction: AxisDirection.left, //上入下出
            position: animation,
          );
        },
        child: Container(
            key: ValueKey<String>(_content.substring(0, length)),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    _content.substring(0, length),
                    style: _textStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: kToolbarHeight +
                                MediaQuery.of(context).padding.top),
                        // color: Colors.red,
                        child: GestureDetector(
                          onTap: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(
                            top: kToolbarHeight +
                                MediaQuery.of(context).padding.top),
                        child: GestureDetector(
                          onTap: () {
                            _content =
                                _content.substring(length, _content.length);

                            if (load(_content)) {
                              print("ooooo===>" + length.toString());
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: kToolbarHeight +
                            MediaQuery.of(context).padding.top),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    child: GestureDetector(
                      onTap: () {},
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }

    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
