import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'routers.dart';

//第一个页面
class FirstFluroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro路由导航示例"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              //点击处理
              onPressed: () {
                //跳转
                _skip1(context);
              },
              child: Text('有参打开第二个页面'),
            ),
            RaisedButton(
              //点击处理
              onPressed: () {
                //跳转
                _skip2(context);
              },
              child: Text('无参打开第二个页面'),
            )
          ],
        ),
      ),
    );
  }



  //不需要返回值的跳转调用
  _skip1(BuildContext context) {
    //路由带的参数
    //通过Routes类里的路由封装导航至第二个页面 可指定页面切换动画类型
    //无返回值的调用，但也能打印出第二个界面退出后的返回值
    Routes.navigateTo(
      context,
      Routes.secondPage,
      params: {"key": "Hello"},
      transition: TransitionType.fadeIn,
    ).then((result) {
      if (result != null) {
        print(result);
      }
    });
  }

  //需要返回值的跳转调用
  _skip2(BuildContext context) async {
    //路由带的参数
    //通过Routes类里的路由封装导航至第二个页面 可指定页面切换动画类型
    //异步获取第二个界面退出后的返回值
    var result = await Routes.navigateToForResult(
      context,
      Routes.secondPage,
      transition: TransitionType.fadeIn,
    );

    print(result.toString());
  }
}
