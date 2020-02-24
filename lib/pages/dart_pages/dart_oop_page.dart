import 'package:flutter/material.dart';

class DartOOPPage extends StatefulWidget {
  @override
  _DartOOPPageState createState() => _DartOOPPageState();
}

class _DartOOPPageState extends State<DartOOPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart面向对象"),
      ),
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () {
              _showOOP1();
              _showOOP2();

              _showOOP3();
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

  _showOOP1() {
    Person person = new Person();
    Person person1 = Person();

    person.name = "person";
    person1.name = "person1";

    person.show();
    person1.show();
  }
}

_showOOP2() {
//  Animal animal1 = new Animal();
//  animal1.name = "猫咪";
//  animal1.age = 1;
//  animal1.show();

  Animal animal2 = new Animal("Dog", 2);
  animal2.show();

  Animal animal3 = Animal.withNew("猪", 1);
  animal3.show();

  const animal4 = Animal1("驴", 10);
  animal4.show();
}

_showOOP3() {
  People people1 = new People(20);
  People people2 = new People(21);
  People people3 = new People(22);
  People people4 = new People(20);

  print("people1 > people2==${people1 > people2}"); //false
  print("people3 > people2==${people3 > people2}"); //true

  print("people4 == people3==${people4 == people3}");//false
  print("people4 == people1==${people4 == people1}");//true
}

//类的定义, class 作为关键字声明
class Person {
  //共有变量
  String name;

  //私有变量
  int _age;

  //final修饰的属性，不能被外部重新赋值，只可读，不可写
  final String phone = '12345678901';

  //类方法
  String show() {
    String msg = "name:${this.name}\tage:${this._age}\tphone:${this.phone}";
    print(msg);
    return msg;
  }

  //私有方法
  void _info() {
    String msg = "name:${this.name}\tage:${this._age}\tphone:${this.phone}";
    print(msg);
  }

  //getter  setter 方法

  //get 获取age
  int get age => _age;

  //set 设置age
  set age(int value) {
    _age = value;
  }
}

//动物类定义
class Animal {
  String name;

  int age;

  //1.默认的无参构造函数
  //Animal() {}

  //2.Dart语法糖有参构造方法，因为Dart 不能重载，所以默认的注释
  Animal(this.name, this.age);

  //3.命名构造方法
  Animal.withNew(String name, int age) {
    this.name = name;
    this.age = age;
  }

  //类方法
  void show() {
    String msg = "name:${this.name}\tage:${this.age}";
    print(msg);
  }
}

//4.常量构造模式
//如果需要将对象作为常量，就需要将构造方法声明为常量构造方法
//使用常量构造方法的对象，属性和构造方法都为常量，属性使用final修饰，构造方法使用const修饰
//常量型对象运行时更快，如果对象的值设置一次后就不会改变，可以使用这种方式
class Animal1 {
  final String name;

  final int age;

  const Animal1(this.name, this.age);

  //类方法
  void show() {
    String msg = "name:${this.name}\tage:${this.age}";
    print(msg);
  }
}

///5.工厂构造方法演示
class Logger {
  static Logger _cache;

//  工厂构造方法：
//  不仅仅是构造方法，更是一种模式
//  有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
//  那么可以使用工厂模式来定义构造方法
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}

// 6.参数列表构造方法

class Animal2 {
  String name;

  int age;

  final String id;

  //
  Animal2(String name, this.age)
      : name = name,
        id = "12";
}

///////////////////////////////////////////////////////////////////////
class People {
  int age;

  People(this.age);

  //重写操作符"=="
  @override
  bool operator ==(other) {
    // TODO: implement ==
    if (other is People) return this.age == other.age;
    return false;
  }

  //重写操作符 >
  bool operator >(People people) {
    return this.age > people.age;
  }
}
