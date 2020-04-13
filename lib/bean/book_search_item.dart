class BookSearchItem {
  //书名
  final String bookName;

  //图书地址
  final String bookUrl;
  //作者
  final String author;

  //最新章节url
  final String lastUrl;

  //最新章节标题
  final String lastTitle;

  //文章类型
  final String type;

  //图书封面
  final String bookCover;

  BookSearchItem(
      this.author, this.lastUrl, this.lastTitle, this.type, this.bookCover, this.bookName, this.bookUrl);

  @override
  String toString() {
    return 'BookSearchItem{bookName: $bookName, bookUrl: $bookUrl, author: $author, lastUrl: $lastUrl, lastTitle: $lastTitle, type: $type, bookCover: $bookCover}';
  }
}
