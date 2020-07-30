import 'package:flutter/material.dart';
import 'package:flutter_travel/widgets/item_widget.dart';
import 'package:vector_math/vector_math.dart' as math;

class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AnimatedSwitcher",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: //DefaultExample(keyCount: _count,),

            AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
//执行缩放动画

            return HSlideTransition(
              child: child,
              direction: AxisDirection.right, //左入右出
              position: animation,
            );
          },
          child: Container(
            alignment: Alignment.center,
            key: ValueKey<int>(_count),
            child: Text(
              '$_count',
//显示指定key，不同的key会被认为是不同的Text，这样才能执行动画

              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        color: Colors.amberAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ++_count;
          });
        },
        child: Text("Start"),
      ),
    );
  }
}

//默认的动画构造器
class DefaultExample extends StatefulWidget {
  final int keyCount;

  const DefaultExample({Key key, this.keyCount}) : super(key: key);

  @override
  _DefaultExampleState createState() => _DefaultExampleState();
}

class _DefaultExampleState extends State<DefaultExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //没有指定transitionBuilder
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
//          return SlideTransition(
//            position: tween.animate(animation),
//            child: child,
//          );
          return MySlideTransition(
              position: tween.animate(animation), child: child);
        },
        duration: Duration(milliseconds: 300),
        child: Text(
          "${widget.keyCount.toString()}",
          //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画，这很重要
          key: ValueKey<int>(widget.keyCount),
          style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

//自定义上下左右出入动画
class HSlideTransition extends AnimatedWidget {
  HSlideTransition({
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
