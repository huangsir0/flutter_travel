//#90F7EC

import 'dart:ui';
import 'package:intl/intl.dart';

extension StringExtension1 on String {
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
    DateFormat dateFormat = new DateFormat("yyyy-MM-dd");
    return dateFormat.format(this);
  }
}
