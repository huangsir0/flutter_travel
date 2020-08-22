import 'package:flutter/material.dart';

class SecondFluroPage extends StatefulWidget {
  //参数
  final String param1;

  const SecondFluroPage({Key key, this.param1}) : super(key: key);

  @override
  _SecondFluroPageState createState() => _SecondFluroPageState();
}

class _SecondFluroPageState extends State<SecondFluroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //显示传递参数值
            Text(
              '${widget.param1 ?? "所传参数为空"}',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  //出栈带上参数 返回至第一个页面
                  Navigator.pop(context, '第二个页面返回参数(${widget.param1 ?? null})');
                },
                child: Text('点击返回'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
