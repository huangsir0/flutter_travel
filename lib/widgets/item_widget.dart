import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget common_item(BuildContext context, String label, Function onTap) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}
