import 'package:flutter_travel/bean/book_search_item.dart';
import 'package:html/parser.dart';

import 'http_respository.dart';

var net = DioFactory.instance;

class Api {

  //搜索书籍的接口，为List赋值
  Future<List<BookSearchItem>> fetchSearchBook(String bookName) async {
    var response;
    List<BookSearchItem> books = new List();
    try {
      //获取到整个网页的代码数据
      response = await net.getString("${StringApi.searchBook}$bookName");
      var document = parse(response);//将String 转换为document对象
      var content = document.querySelector(".librarylist");//找到标签中librarylist的节点，类选择器节点的查找前面要加个.
      var lefts = content.querySelectorAll(".pt-ll-l");//找到所有pt-ll-l节点
      var rights = content.querySelectorAll(".pt-ll-r");//找到所有pt-ll-r 节点
      int count = lefts.length > rights.length ? rights.length : lefts.length;//取最短数据，这里是为了保险，防止数组越界
      for (int i = 0; i < count; i++) {
        //在pt-ll-l，pt-ll-r 节点下找到目标数据
        BookSearchItem item = new BookSearchItem(
            rights[i].querySelectorAll(".info>span")[1].text.trim(),//第二个span元素值,获取作者
            rights[i].querySelector(".last>a").attributes["href"].trim(),//href 属性值，最后一章的Url
            rights[i].querySelector(".last>a").text.trim(),//元素值，获取标题
            rights[i].querySelectorAll(".info>span")[2].text.trim(),//第三个span元素值,获取小说分类
            lefts[i].querySelector("div>a>img").attributes['src'].trim(),//获取小说图片
            lefts[i].querySelector("div>a>img").attributes['alt'].trim(),//获取书名
            lefts[i].querySelector("div>a").attributes['href'].trim());//获取书URL
        books.add(item);
        print(item.toString());
      }
      return books;
    } catch (e) {
      print(e);
    }

    return books;
  }
}

class StringApi {

  //搜索小说的接口
  static const searchBook = "search.html?searchtype=novelname&searchkey=";
}
