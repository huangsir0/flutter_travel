import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/fluro/routers.dart';

import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //创建路由对象
    final router = Router();

    //配置路由集Routes的路由对象
    Routes.configureRoutes(router);

    //给Routes 的router赋值
    Routes.router = router;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
      onGenerateRoute: Routes.router.generator,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
