import 'package:flutter/material.dart';
import 'package:flutter_travel/widgets/rating_bar.dart';
import 'dart:math' as math;

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Star"),
        ),
        body: new Padding(
          padding: new EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              new ClipOval(
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3675415932,4054970339&fm=26&gp=0.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3675415932,4054970339&fm=26&gp=0.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new ClipRect(
                clipper: new _MyClipper(),
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3675415932,4054970339&fm=26&gp=0.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new ClipPath(
                clipper: new _StarCliper(radius: 50.0),
                child: new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new Image.network(
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3675415932,4054970339&fm=26&gp=0.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new StaticRatingBar(
                size: 20.0,
                rate: 4.5,
              ),
              new Row(
                children: <Widget>[
                  new RatingBar(
                    size: 30.0,
                    radiusRatio: 1.4,
                    onChange: (int value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  new Text("分数${_value}"),
                ],
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

class _MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(10.0, 10.0, size.width - 10.0, size.height - 10.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _StarCliper extends CustomClipper<Path> {
  final double radius;

  _StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (math.pi * degree / 180);
  }

  Path createPath(double radius, Path path) {
    double radian = degree2Radian(36); // 36为五角星的角度
    double radius_in =
        (radius * math.sin(radian / 2) / math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo((radius * math.cos(radian / 2) + radius_in * math.sin(radian)),
        (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) * 2),
        (radius - radius * math.sin(radian / 2)));
    path.lineTo(
        (radius * math.cos(radian / 2) + radius_in * math.cos(radian / 2)),
        (radius + radius_in * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) + radius * math.sin(radian)),
        (radius + radius * math.cos(radian)));
    path.lineTo((radius * math.cos(radian / 2)), (radius + radius_in));
    path.lineTo((radius * math.cos(radian / 2) - radius * math.sin(radian)),
        (radius + radius * math.cos(radian)));
    path.lineTo(
        (radius * math.cos(radian / 2) - radius_in * math.cos(radian / 2)),
        (radius + radius_in * math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * math.sin(radian / 2)));
    path.lineTo((radius * math.cos(radian / 2) - radius_in * math.sin(radian)),
        (radius - radius * math.sin(radian / 2)));
    return path;
  }

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path = createPath(this.radius / 5, path);
    path = path.shift(new Offset(20.0, 0.0));
    path = createPath(this.radius / 5, path);
    path = path.shift(new Offset(20.0, 0.0));
    path = createPath(this.radius / 5, path);
    path = path.shift(new Offset(20.0, 0.0));
    path = createPath(this.radius / 5, path);
    path = path.shift(new Offset(20.0, 0.0));
    path = createPath(this.radius / 5, path);
    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(_StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }

}
