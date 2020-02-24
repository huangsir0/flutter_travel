import 'package:flutter/material.dart';

class DartDataTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用数据类型"),
      ),
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () {
              _showDataType();
              _showStringType();
              _showBoolType();
              _showListType();
              _showMapType();
              _showSpecialType();
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

  //数值类型
  void _showDataType() {
    int num = 90;
    int n = 23;
    print("num=${num}"); //90
    print("n=${n}"); //23

    print("============运算符============");
    print("num+n=${num + n}"); //113
    print("num-n=${num - n}"); //67
    print("num*n=${num * n}"); //2070
    print("num~/n=${num ~/ n}"); //取整,3
    print("num%n=${num % n}"); //取余,21
    print("num/n=${num / n}"); //取长除法结果,3.9130434782608696

    print("============属性============");
    print((-9).isNaN); //false //如果数字是非数字双精度值，则为true；否则为true。否则为假。
    print((0 / 0).isNaN); //true
    print((-9).isNegative); //true//是否是小与0的数
    print((0).isNegative); //false //是否是小与0的数
    print(num.isEven); //true//是否是偶数
    print(num.isOdd); //false//是否是奇数
    print(num.sign); //1//返回该整数的符号(对于0返回0，对于小于0的值返回 -1，对于大于0的值返回 1。)

    print("============方法============");

    double num1 = 3.1314;

    print(num1.toInt()); //3//转成int类型 (舍去小数)
    print(num.toDouble()); //90.0//转成double类型
    print((-3.14).abs()); //3.14//绝对值
    print(num1.round()); //3//四舍五入
    print(num1.ceil()); //4//返回此不小于的最小整数  比如5.2, 返回的是6,+0.5再四舍五入
    print(num1.floor()); //3//返回此不大于的最大整数  比如5.2, 返回的是5
    print(num1.truncate()); //3//返回去掉小数点后面的整数
    print(num1.truncateToDouble()); //3.0
    print(3.54.truncateToDouble()); //3.0

    print("============常用转换方法============");

    print(int.parse("3")); //3                //String=>int
    print(double.parse("3.14")); //3.14       //String=>double
    print(num1.toString()); //3.1314          //double=>String
    print(num1.toStringAsFixed(3)); //3.131   // double=>String
  }
}

//字符串类型
void _showStringType() {
  String str1 = '字符串', str2 = "双引号"; //字符串定义
  String str3 = 'st1:$str1\tstr2:$str2'; //字符串拼接

  String str4 = "+号拼接:\t" + 'st1:' + str1 + '\tstr2:' + str2; //字符串拼接,'\'转义

  String str5 = "{}号拼接:\tst1:${str1}\tstr2:${str2}";

  print(str3);
  print(str4);
  print(str5);

  print("============常用方法============");
  String str6 = "在爱情里，不被爱的那个才是第三者。";
  print("str6.length=" + str6.length.toString()); //字符串长度
  print(str6.indexOf("爱")); //获取指定字符串位置,返回第一个
  print(str6.substring(1, 9)); //字符串截取
  print("str6.startsWith('在爱情')==" + str6.startsWith("在爱情").toString()); //判断
  print(str6.replaceAll("第三者", "你")); //字符串替换
  print(str6.split("爱").toString()); //切割字符串//根据"爱"切割字符串
  print("str6.contains('在爱情')==" + str6.contains("在爱情").toString()); //判断是否包含
  print("i love u".toUpperCase()); //转大写
  print("I LOVE U".toLowerCase()); //转小写
  print("".isEmpty); //为空判断
}

//Flutter中经常用到三目运算
void _showBoolType() {
  bool success = true, fail = false;
  bool heihei;
  print(heihei); //null
  print(success);
  print(fail);
  print(success || fail); //true
  print(success && fail); //false

  int a = 99, b = 78, c = 210;

  int max = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);

  print("a,b,c最大值:" + max.toString());
}

//List结合列表
void _showListType() {
  List list1 = [1, 2, 3, "Hello", false];

  list1[2] = "世界"; //修改下标为2 的值

  print(list1.length); //5//列表长度
  list1.add("心跳"); //添加元素

  List list2 = List.generate(3, (index) {
    return index + 9;
  }); //[9,10,11]

  list1.addAll(list2); //添加多个元素//[1, 2, 世界, Hello, false, 心跳, 9, 10, 11]

  list1.insert(1, "hi"); //向指定位置插入元素

  print(list1);
  // 移除数组中的元素
  list1.remove("value");
  print(list1);

  // 移除数组中指定的元素
  list1.removeAt(1);
  print(list1);

  // 判断数组中是否有某个元素
  print(list1.indexOf("element")); // 输出结果：-1

  // 可以使用 sort() 函数来排序, 但是由于我们使用定义的数组类型不一样，就不能使用
  var list3 = [10, 22, 53, 216, 53];

  // 根据语法提示： List.sort([(int, int) → int compare]) → void
  list3.sort((a, b) => a.compareTo(b));
  print(list3); // 输出结果：

  print("============集合遍历1============");

  ///遍历集合的方式
  for (int i = 0; i < list3.length; i++) {
    print(list3[i]);
  }
  print("============集合遍历2============");
  for (var o in list3) {
    print(o);
  }
  print("============集合遍历3============");
  list3.forEach((val) {
    print(val);
  });
}

void _showMapType() {
  // 创建Map
  var map = {'sf': '影魔', 'viper': '冥界亚龙'};

  // 获取长度
  print(map.length); // 输出：2
  // 判断是否为空
  print(map.isEmpty); // 输出：false
  print(map.isNotEmpty); // 输出：true
  // 获取到所有的 key
  print(map.keys); // 输出：(sf, viper)
  // 获取到所有的 values
  print(map.values); // 输出：(影魔, 冥界亚龙)

  // 判断是否包含某个key
  print(map.containsKey("key")); // 输出：false

  // 判断是否包含某个value
  print(map.containsValue("key")); // 输出：false

  // 添加一个新的元素进去
  map['spa'] = '幽鬼';
  print(map); // 输出：{sf: 影魔, viper: 冥界亚龙, spa: 幽鬼}

  // 循环打印 代码提示：Map.forEach((String, String) → void f) → void
  map.forEach((key, value) => print("key:${key}, value:${value}"));
}

void _showSpecialType() {
  print('----dynamic,var,Object----');
  print('--------------------------');
  print('----dynamic----');
  dynamic x = 'hello';
  print(x.runtimeType);
  //print(x.hello()); //此处编译能通过，但是运行报错 提示Class 'String' has no instance method 'hello'.
  print(x);
  x = 123;
  print(x);
  print(x.runtimeType);
  print('----var----');
  var a = 'hello';
  // a = 123;//编译报错//你可以改变 x的类型，但是无法改变 a的类型
  print(a.runtimeType);
  print(a);
  print('----Object----');
  Object o1 = 'hello';
  print(o1.runtimeType);
  print(o1);
  o1 = 345;
  print(o1);
  print(o1.runtimeType);
}

//