import 'package:flutter/material.dart';

//暂时还未添加白板缩放动画，仿IOS的Switcher控件
class HclSwitcher extends StatefulWidget {
  //传入的高
  final double height;

  //传入的宽
  final double width;

  //开着的颜色
  final Color activeColor;

  //关闭的颜色
  final Color dissColor;

  //显示的文字
  final String label;

  //开关标识
  final bool isOpen;

  //原生IOS控件关闭时候有一个白色背景板
  final isShowWhiteBg;

  //回调
  final ValueChanged<bool> onChange;

  //构造方法，我这里规定传入宽必须比高大，目的就是画圆的时候用的是最小的宽或高的值（此处最小的值就是高的值）
  HclSwitcher({
    Key key,
    this.height,
    this.width,
    this.label,
    this.activeColor,
    this.dissColor,
    this.isOpen,
    this.onChange,
    this.isShowWhiteBg = false,
  }) : super(key: key) {
    if (this.height >= this.width) throw "宽必须必高大";
  }

  @override
  _HclSwitcherState createState() => _HclSwitcherState();
}

class _HclSwitcherState extends State<HclSwitcher>
    with TickerProviderStateMixin {
  //控制开关
  bool _isOpen;

  //动画控制器，动画原理就是通过animation值的变化，控制Positioned的左右边距
  AnimationController controller;

  //动画值
  Animation<double> animation;

  bool isInit = true; //第一次初始化不用调用动画

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isOpen = widget.isOpen;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear))
          ..addListener(() {
            setState(() {
              print("value${animation.value}");
            });
          })
          ..addStatusListener((status) {
            print(status);
          });

    print("init${animation.value}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.reset();
        controller.forward();
        isInit = false;
        setState(() {
          _isOpen = !_isOpen;
          if (null != widget.onChange) widget.onChange(_isOpen);
        });
      },
      child: Container(
        //大背景控件
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
          color: _isOpen ? widget.activeColor : widget.dissColor,
        ),
        child: Stack(
          children: <Widget>[
            _isOpen
                ? Container()
                : widget.isShowWhiteBg
                    ? Positioned(
                        top: 2,
                        left: 2,
                        right: 2,
                        child: Container(
                            alignment: Alignment.center,
                            height: widget.height - 4,
                            width: widget.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widget.height / 2)),
                              color: Colors.white,
                            )),
                      )
                    : Container(),
            Container(
              margin: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              child: _isOpen
                  ? Text(
                      widget.label,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  : Container(),
            ),
            isInit
                ? Positioned(
                    right: _isOpen ? 0 : widget.width - widget.height,
                    child: Container(
                      height: widget.height,
                      width: widget.height,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget.height / 2))),
                      ),
                    ))
                : Positioned(
                    left: !_isOpen
                        ? null
                        : (widget.width - widget.height) * animation.value,
                    right: _isOpen
                        ? null
                        : (widget.width - widget.height) * animation.value,
                    child: Container(
                      height: widget.height,
                      width: widget.height,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget.height / 2))),
                      ),
                    ))
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    controller?.stop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
}
