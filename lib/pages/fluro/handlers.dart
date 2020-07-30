//创建Handler用来接收路由参数及返回第二个页面对象

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'second_fluro_page.dart';

Handler secondPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  if (params != null&&params.length>0) {
    String key = params['key'].first;
    return SecondFluroPage(
      param1: key,
    );
  } else {
    return SecondFluroPage();
  }
});
