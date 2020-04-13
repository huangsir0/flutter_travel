import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_travel/bean/book_search_item.dart';
import 'package:flutter_travel/util/api.dart';
import 'package:flutter_travel/widgets/item_widget.dart';

class DemoBiqugePage extends StatefulWidget {
  @override
  _DemoBiqugePageState createState() => _DemoBiqugePageState();
}

class _DemoBiqugePageState extends State<DemoBiqugePage> {
  Api _api = new Api();

  List<BookSearchItem> _books = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _api.fetchSearchBook("元尊").then((data) {
      setState(() {
        _books.clear();
        _books.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("笔趣阁爬虫示例"),
      ),
      body: _books.length == 0
          ? Center(
              child: Text("正在加载数据..."),
            )
          : Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return item_book_search(context, _books[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 2,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                  itemCount: _books.length),
            ),
    );
  }
}
