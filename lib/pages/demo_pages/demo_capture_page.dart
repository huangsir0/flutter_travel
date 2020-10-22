import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class DemoCapturePage extends StatefulWidget {
  @override
  _DemoCapturePageState createState() => _DemoCapturePageState();
}

class _DemoCapturePageState extends State<DemoCapturePage> {
  GlobalKey _key = new GlobalKey();

  List<String> _images = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter截图"),
        ),
        body: Column(
          children: <Widget>[
            RepaintBoundary(
              key: _key, //设置Key
              child: Container(
                child: Image.network(
                  "https://visualhunt.com/photos/1/orange-oranges-fruit-sweet-food.jpg?s=l",
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                //截图
                _onCaputrePicture();
              },
              child: Text("截图"),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  //childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  Image image =
                      Image.file(File.fromUri(Uri.parse(_images[index])));
                  return image;
                },
              ),
            )
          ],
        ));
  }

  //截图
  void _onCaputrePicture() async {
    try {
      RenderRepaintBoundary boundary = _key.currentContext.findRenderObject();
      double pix = window.devicePixelRatio; // 获取当前设备的像素比
      var image = await boundary.toImage(pixelRatio: pix);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      Directory tempDir =
          await getTemporaryDirectory(); //需添加 path_provider: 1.6.11 插件
      File file = new File('${tempDir.path}/${_images.length}.png');
      print("===》" + file.path);
      if (!file.existsSync()) {
        file.createSync();
      }
      file.writeAsBytesSync(pngBytes); //写入文件
      _images.add(file.path); //添加一个路径
      setState(() {}); //刷新界面
    } catch (e) {
      print(e);
    }
  }
}
