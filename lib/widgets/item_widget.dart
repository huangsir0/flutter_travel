import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel/bean/book_search_item.dart';
import 'package:flutter_travel/util/http_respository.dart';

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

Widget item_book_search(BuildContext context, BookSearchItem book) {
  return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Container(
          child: Container(
              height: 140,
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 80,
                    child: CachedNetworkImage(
                        imageUrl: Config.baseImgUrl + book.bookCover),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            book.bookName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 18.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Text(
                                "类型：" + book.type.split('：')[1],
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                book.author,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            book.lastTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 16.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )),
        ),
      ));
}
