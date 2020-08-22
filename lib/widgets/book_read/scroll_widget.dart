import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  final String content;

  final Function onLoadPre;

  final Function onLoadNext;

  final TextStyle textStyle;


  final Function onMenuClick;

  const ScrollWidget(
      {Key key, this.content, this.onLoadPre, this.onLoadNext, this.textStyle, this.onMenuClick})
      : super(key: key);

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  //默认显示第一页
  bool _isShowA = true;

  ScrollController _scrollControllerA = new ScrollController();
  ScrollController _scrollControllerB = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollControllerA.addListener(() {
      if (_scrollControllerA.offset ==
          _scrollControllerA.position.maxScrollExtent) {
        setState(() {
          _isShowA = false;
          _scrollControllerA.jumpTo(0);
        });
        widget.onLoadNext();
        print("A底部");
      } else if (_scrollControllerA.offset ==
          _scrollControllerA.position.minScrollExtent) {
        print("A顶部");

        setState(() {
          _isShowA = false;
          _scrollControllerA.jumpTo(0);
        });
        widget.onLoadPre();
      }
    });

    _scrollControllerB.addListener(() {
      if (_scrollControllerB.offset ==
          _scrollControllerB.position.maxScrollExtent) {
        print("B底部");
        setState(() {
          _isShowA = true;
          _scrollControllerB.jumpTo(0);
        });
        widget.onLoadNext();
      } else if (_scrollControllerB.offset ==
          _scrollControllerB.position.minScrollExtent) {
        setState(() {
          _isShowA = true;
          _scrollControllerB.jumpTo(0);
        });
        widget.onLoadPre();
        print("B顶部");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
          children: <Widget>[
            _isShowA ? _getA() : _getB(),
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
                      onTap: () {},
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
        ))
      ],
    );
  }

  Widget _getA() {
    return SingleChildScrollView(
      controller: _scrollControllerA,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    widget.content,
                    style: widget.textStyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getB() {
    return SingleChildScrollView(
      controller: _scrollControllerB,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    widget.content,
                    style: widget.textStyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
