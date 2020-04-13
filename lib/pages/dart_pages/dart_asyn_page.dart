import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/dart_pages/dart_oop_page.dart';

class DartAsyncPage extends StatefulWidget {
  @override
  _DartAsyncPageState createState() => _DartAsyncPageState();
}

class _DartAsyncPageState extends State<DartAsyncPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart异步"),
      ),
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () {
              //main();
              //main1();
              // main2();
              // main4();

              //main5();

              //main6();

              main8();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor.withOpacity(.5),
                    Theme.of(context).primaryColor.withOpacity(.7),
                  ])),
              child: Text(
                "点击运行",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  main() {
    print("main---->start");
    print(doSomeThingNormal());
    print("main---->end");
  }

  main1() {
    print("main---->start");
    print(doSomeThingAsync());
    print("main---->end");
  }

  doThings() async {
    String msg = await doSomeThingAsync();
    print(msg);
  }

  main4() {
    print("main---->start");
    doThings();
    print("main---->end");
  }

  fun1() async {
    print("fun1---->start");
    String msg = await fun2();
    print("fun1:msg:\t${msg}");
  }

  fun2() async {
    print("fun2---->");
    return "Hello world";
  }

  main5() {
    print("main---->start");
    fun1();
    print("main---->end");
  }

  main6() {
    Future(() => print("立刻在Event queue中运行的Future"));
    Future.delayed(
        Duration(seconds: 2), () => print("2秒后在Event queue中运行的Future"));
    Future.microtask(() => print('在Microtask queue里运行的Future'));
    Future.sync(() => print('同步运行的Future'));
  }

  main7() {
    Future(() => print("立刻在Event queue中运行的Future")).then(fun1(), onError: (e) {
      handleError(e);
    }).then(fun2(), onError: (e) {
      handleError(e);
    });
  }

  main8() {
    // 实例化一个Completer
    var completer = Completer();
    // 这里可以拿到这个completer内部的Future
    var future = completer.future;
    future.then((_)=>print("then"));

    //...someThing elses
    completer.complete("finished");
  }

  doSomeThingNormal() {
    sleep(Duration(seconds: 2));
    return "Normal---->doSomeThing";
  }

  doSomeThingAsync() async {
    return Future<String>(() {
      sleep(Duration(seconds: 2));
      return "Async---->doSomeThing";
    });
  }

  main2() {
    //事件队列
    async_event();
    //微任务队列
    foo();
  }

  foo() {
    print("foo");
    scheduleMicrotask(foo);
  }

  async_event() async {
    print("normal_event");
  }

  //普通
  getNormalString() {
    return "normal---->string";
  }

  //异步
  getAsyncString() async {
    String msg = "async---->string";
    return msg;
  }

  void handleError(e) {
    print(e);
  }
}
