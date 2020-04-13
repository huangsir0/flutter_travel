import 'package:flutter/material.dart';

class ShaderMasksPage extends StatefulWidget {
  @override
  _ShaderMasksPageState createState() => _ShaderMasksPageState();
}

class _ShaderMasksPageState extends State<ShaderMasksPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..repeat(); //重复
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear)); //设置一个线性
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMask"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, right: 10, left: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                child: ShaderMask(
                  shaderCallback: (bounds) => RadialGradient(
                      tileMode: TileMode.mirror,
                      radius: 1.5,
                      colors: [
                        Colors.indigoAccent,
                        Colors.greenAccent,
                        Colors.red
                      ]).createShader(bounds),
                  child: Text(
                    "ShaderMask",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 200,
                width: double.infinity,
                color: Colors.black,
                alignment: Alignment.center,
                child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget widget) {
                      return ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                            tileMode: TileMode.repeated,
                            colors: [
                              Colors.indigoAccent,
                              Colors.greenAccent,
                              Colors.red
                            ],
                            stops: [
                              _animation.value - 0.3,
                              _animation.value,
                              _animation.value + 0.3
                            ]).createShader(bounds),
                        child: Text(
                          "ShaderMask",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController?.dispose();
    super.dispose();
  }
}
