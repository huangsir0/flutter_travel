import 'package:flutter/material.dart';
import 'package:flutter_travel/pages/dart_pages/dart_home_page.dart';
import 'package:flutter_travel/pages/demo_pages/demo_home_page.dart';
import 'package:flutter_travel/pages/flutter_pages/flutter_home_page.dart';

import 'common/constans.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  var _currentIndex = 0; //当前页

  var _tabs = ["Dart", "Flutter", "Demo"];

  List<Widget> _pages;

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: _currentIndex);
    _pages = [
      DartHomePage(),
      FlutterHomePage(),
      DemoHomePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(MyIcons.dart), title: Text(_tabs[0])),
          BottomNavigationBarItem(
              icon: Icon(MyIcons.flutter), title: Text(_tabs[1])),
          BottomNavigationBarItem(
              icon: Icon(MyIcons.demo), title: Text(_tabs[2])),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
