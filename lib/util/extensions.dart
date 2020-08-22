import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  //字符转换成Color对象
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }

  //字符转int
  parseInt() {
    return int.parse(this);
  }
}

extension DateTimeExtension on DateTime {
  toFormatString() {
    DateFormat dateFormat = new DateFormat("yyyy-MM-dd HH:mm:ss");
    return dateFormat.format(this);
  }
}

//扩展list的方法
extension HclLis<T> on List<T> {
  //扩展属性
  int get doubleLength => length * 2;

  //扩展操作符
  List<T> operator -() => reversed.toList();

  //一个链表分割成两个
  List<List<T>> split(int at) => <List<T>>[sublist(0, at), sublist(at)];
}

extension HclWidget on Widget {
  Widget marginAll(double margin) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin),
      child: this,
    );
  }
}
