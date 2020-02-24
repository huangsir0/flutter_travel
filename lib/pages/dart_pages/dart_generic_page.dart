import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/dart_pages/dart_oop_page.dart';

class DartGenericPage extends StatefulWidget {
  @override
  _DartGenericPageState createState() => _DartGenericPageState();
}

class _DartGenericPageState extends State<DartGenericPage> {
  List<dynamic> datas = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas.add("11111");
    datas.add(2);
    datas.add(3.444);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart泛型"),
      ),
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () {
              print(datas.toString());
              //_showT1();
              _showT2();
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

  _showT1() {
    Person person = new Person("小明");

    CacheObj cacheObj = new CacheObj();
    cacheObj.data = person;
    //print("CacheObj===>" + cacheObj.data.name); //编译不通过

    print("CacheObj===>" + (cacheObj.data as Person).name); //编译通过,正常打印

    CacheDynamic cacheDynamic = new CacheDynamic();
    cacheDynamic.data = person;
    print("CacheDynamic===>" + cacheDynamic.data.name); //编译通过,正常打印，

    // 但是这有很大的隐患，因为这里它不做类型检查，意味着我们写别的属性也是能编译通过的，例如：
    print("CacheDynamic===>" + cacheDynamic.data.age); //编译通过,但是运行肯定报错了，
    //这就给程序带来很大的隐患，而且这种问题还不太容易发现

    CacheType<Person> cacheType = new CacheType();
    cacheType.data = person;
    print("CacheType===>" +
        cacheType.data.name); //愉快的正常打印，而且编译器知道取出来的数据就是Person类型
  }

  _showT2() {
    Manager<Person> manager = new Manager<Person>();
    manager.add(new Person("小鱼"));
    manager.add(new Person("小黑"));
    manager.add(new Person("SF"));

    print("get--->" + manager.get(1).name);

    manager.sop();
  }
}

//存放Object的类
class CacheObj {
  //存放一个Object类型数据data
  Object _data;

  Object get data => _data;

  set data(Object value) {
    _data = value;
  }
}

//存放一个动态类型的类
class CacheDynamic {
  //存放一个dynamic类型数据data
  dynamic _data;

  dynamic get data => _data;

  set data(dynamic value) {
    _data = value;
  }
}

//存放泛型T的类
class CacheType<T> {
  //存放一个T 类型的数据 data

  T _data;

  T get data => _data;

  set data(T value) {
    _data = value;
  }
}

//实体类
class Person {
  String name;

  Person(this.name);

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}

//存放多种类型的数据
class CacheTpyes<T1, T2, T3> {
  T1 _data1;

  T2 _data2;

  T3 _data3;

  T1 get data1 => _data1;

  set data1(T1 value) {
    _data1 = value;
  }

  T2 get data2 => _data2;

  set data2(T2 value) {
    _data2 = value;
  }

  T3 get data3 => _data3;

  set data3(T3 value) {
    _data3 = value;
  }
}

/**
 * 格式:接口名后面跟 <T>
 *
 * @param <T>
 */
abstract class IManager<T> {
  void add(T data);

  T get(int index);

  void sop();
}

/**
 * 实现了IManager泛型接口的泛型类
 */
class Manager<T> implements IManager<T> {
  //数据集合
  List<T> _datas;

  //构造
  Manager() {
    _datas = new List();
  }

  //泛型方法，
  @override
  void add(T data) {
    // TODO: implement add
    _datas.add(data);
  }

  //泛型方法，
  @override
  T get(int index) {
    // TODO: implement remove
    return _datas[index];
  }

  @override
  void sop() {
    // TODO: implement sop
    for (T t in _datas) {
      print(t.toString());
    }
  }
}

///有时候你在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这时可以使用类型约束
class Member<T extends Person> {
  T _person;

  ///泛型作用：约束参数类型
  Member(this._person);

  @override
  String toString() {
    return 'Member{_person: $_person}';
  }
}
