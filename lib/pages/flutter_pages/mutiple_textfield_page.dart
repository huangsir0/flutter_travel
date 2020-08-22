import 'package:flutter/material.dart';

class MutipleTextFieldPage extends StatefulWidget {
  @override
  _MutipleTextFieldPageState createState() => _MutipleTextFieldPageState();
}

class _MutipleTextFieldPageState extends State<MutipleTextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MutipleTextFieldPage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            TextField(
              keyboardType: TextInputType.text,
              maxLines: 5,
              minLines: 1,
            ),
            Row(
                children: <Widget>[
                  Text('111'),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: '输入',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        isDense: true,
                        border: const OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('222'),
                ]
            )

          ],
        ),
      ),
    );
  }
}
