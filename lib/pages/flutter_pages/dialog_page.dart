import 'package:flutter/material.dart';
import 'package:flutter_travel/widgets/item_widget.dart';
import 'package:vector_math/vector_math.dart' as math;

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dialog",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            common_item(context, "AlertDialog", () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alert Dialog"),
                      content: Text("Hello Alert Dialog"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(this);
                            },
                            child: Text("关闭"))
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    );
                  });
            }),
            //自定义Dialog
            common_item(context, "自定义Dialog", () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BaseDialog(
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.center,
                              child: Text(
                                "自定义Dialog",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 2,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 20),
                                child: Text("Hello 自定义Dialog"),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop(this);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.4),
                                              Theme.of(context).primaryColor
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Text(
                                          "关闭",
                                          style: TextStyle(
                                              letterSpacing: 3,
                                              color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        240,
                        MediaQuery.of(context).size.width * .6);
                  });
            }),
            //旋转动画Dialog
            common_item(context, "旋转Dialog", () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {},
                  barrierColor: Colors.grey.withOpacity(.4),
                  barrierDismissible: true,
                  barrierLabel: "",
                  transitionDuration: Duration(milliseconds: 400),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return Transform.rotate(
                      angle: math.radians(anim1.value * 360),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        title: Text("Dialog"),
                        content: Text("Hello world"),
                      ),
                    );
                  });
            }),
            //缩放动画Dialog
            common_item(context, "缩放Dialog", () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {},
                  barrierColor: Colors.grey.withOpacity(.4),
                  barrierDismissible: true,
                  barrierLabel: "",
                  transitionDuration: Duration(milliseconds: 400),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return Transform.scale(
                      scale: anim1.value,
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        title: Text("Dialog"),
                        content: Text("Hello world"),
                      ),
                    );
                  });
            }),

            //旋转渐变动画Dialog
            common_item(context, "旋转渐变Dialog", () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {},
                  barrierColor: Colors.grey.withOpacity(.4),
                  barrierDismissible: true,
                  barrierLabel: "",
                  transitionDuration: Duration(milliseconds: 400),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return Transform.rotate(
                        angle: math.radians(anim1.value * 360),
                        child: Opacity(
                          opacity: anim1.value,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: Text("Dialog"),
                            content: Text("Hello world"),
                          ),
                        ));
                  });
            }),

            //缩放渐变动画Dialog
            common_item(context, "缩放渐变Dialog", () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {},
                  barrierColor: Colors.grey.withOpacity(.4),
                  barrierDismissible: true,
                  barrierLabel: "",
                  transitionDuration: Duration(milliseconds: 400),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return Transform.scale(
                        scale: anim1.value,
                        child: Opacity(
                          opacity: anim1.value,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: Text("Dialog"),
                            content: Text("Hello world"),
                          ),
                        ));
                  });
            }),

            //曲线Dialog
            common_item(context, "曲线Dialog", () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {},
                  barrierColor: Colors.grey.withOpacity(.4),
                  barrierDismissible: true,
                  barrierLabel: "",
                  transitionDuration: Duration(milliseconds: 400),
                  transitionBuilder: (context, anim1, anim2, child) {
                    final curvedValue =
                        Curves.easeInOutBack.transform(anim1.value) - 1.0;
                    return Transform(
                        transform: Matrix4.translationValues(
                            0.0, curvedValue * 200, 0.0),
                        child: Opacity(
                          opacity: anim1.value,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: Text("Dialog"),
                            content: Text("Hello world"),
                          ),
                        ));
                  });
            }),
          ],
        ),
      ),
    );
  }
}

class BaseDialog extends Dialog {
  //子控件
  final Widget widget;

  // 高
  final double height;

  //宽
  final double width;

  BaseDialog(this.widget, this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: new Material(
            type: MaterialType.transparency,
            child: new Container(
                height: this.height,
                width: this.width,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ))),
                child: this.widget),
          )),
    );
  }
}
