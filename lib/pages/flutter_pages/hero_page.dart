import 'package:flutter/material.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

const Tag = "tag"; ////唯一标记，前后两个路由页Hero的tag必须相同

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3; //动画过渡时间
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, right: 5, left: 5),
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Hero(
                            tag: Tag,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/datas/night.jpg",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            )),
                        onTap: () {
//                    Navigator.of(context).push(
//                        new MaterialPageRoute(builder: (BuildContext context) {
//                          return new HeroAnimationPage1();
//                        }));

                          Navigator.push(context, PageRouteBuilder(pageBuilder:
                              (BuildContext context, Animation animation,
                                  Animation secondaryAnimation) {
                            return new FadeTransition(
                              opacity: animation,
                              child: Scaffold(
                                appBar: AppBar(
                                  title: Text("Fade"),
                                ),
                                body: HeroAnimationRouteWithFade(),
                              ),
                            );
                          }));
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "下面的案例仅仅只是添加了RectTween",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 100),
                  child: _buildHero(context, 'assets/datas/empty.png', '空空如也'),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class HeroAnimationPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero1"),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Hero(
              tag: Tag, //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "assets/datas/night.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ));
  }
}

class HeroAnimationRouteWithFade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Hero(
          tag: "tag", //唯一标记，前后两个路由页Hero的tag必须相同
          child: ClipOval(
            child: Image.asset(
              "assets/datas/night.jpg",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////
//华丽的分割线
///////////////////////////////////

const double kMinRadius = 40.0;
const double kMaxRadius = 150.0;

class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          photo,
          color: Colors.green.withOpacity(.8),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

RectTween _createRectTween(Rect begin, Rect end) {
  print("begin=${begin}\t end=${end}");
  return MaterialRectCenterArcTween(begin: begin, end: end);
}

Widget _buildHero(BuildContext context, String imageName, String description) {
  return Container(
    width: kMinRadius * 2.0,
    height: kMinRadius * 2.0,
    child: Hero(
      createRectTween: _createRectTween,
      tag: imageName,
      child: RadialExpansion(
        maxRadius: kMaxRadius,
        child: Photo(
          photo: imageName,
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder<void>(
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return FadeTransition(
                      opacity: animation,
                      child: _showDetailPage(context, imageName, description));
                },
              ),
            );
          },
        ),
      ),
    ),
  );
}

Widget _showDetailPage(
    BuildContext context, String imageName, String description) {
  return Container(
    color: Theme.of(context).canvasColor,
    child: Center(
      child: Card(
        elevation: 8.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: kMaxRadius * 2.0,
              height: kMaxRadius * 2.0,
              child: Hero(
                createRectTween: _createRectTween,
                tag: imageName,
                child: RadialExpansion(
                  maxRadius: kMaxRadius,
                  child: Photo(
                    photo: imageName,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 3.0,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    ),
  );
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
