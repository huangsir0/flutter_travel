import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  List<String> parents = [
    "武庚纪",
    "斗罗堂",
    "诛仙镇",
    "死灵渊",
  ];

  List<Map<String, dynamic>> childs = [
    {
      "head":
          "http://tvax3.sinaimg.cn/large/0065SLfTly1fvu04gzb5gj30u01o04qp.jpg",
      "nickname": "逆天而行",
      "motto": "会是个笑话吗？或许吧。"
    },
    {
      "head":
          "http://tvax3.sinaimg.cn/large/0065SLfTly1fvu04gzb5gj30u01o04qp.jpg",
      "nickname": "逆天而行",
      "motto": "会是个笑话吗？或许吧。"
    },
    {
      "head":
          "http://tvax3.sinaimg.cn/large/0065SLfTly1fvu04gzb5gj30u01o04qp.jpg",
      "nickname": "逆天而行",
      "motto": "会是个笑话吗？或许吧。"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("仿QQ分组"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GroupItem(
                parent: parents[index],
                childs: childs,
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                width: double.infinity,
              );
            },
            itemCount: parents.length),
      ),
    );
  }
}

//Item

class GroupItem extends StatefulWidget {
  final String parent;

  final List<Map<String, dynamic>> childs;

  const GroupItem({Key key, this.parent, this.childs}) : super(key: key);

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem>
    with SingleTickerProviderStateMixin {
  Animation _animation;

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _animation = new Tween(begin: 0.0, end: 0.25).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        onExpansionChanged: (flag) {
          _changeAnimation(flag);
        },
        trailing: Text(
          "4/10",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        title: Container(
          margin: EdgeInsets.only(),
          child: Row(
            children: <Widget>[
              RotationTransition(
                turns: _animation,
                child: Icon(Icons.arrow_right),
              ),
              Container(
                child: Text(
                  widget.parent,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black.withOpacity(.8)),
                ),
              )
            ],
          ),
        ),
        children: _getChildren(widget.childs).toList(),
      ),
    );
  }

  _changeAnimation(bool expand) {
    setState(() {
      if (expand) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  Iterable<Widget> _getChildren(List<Map<String, dynamic>> childs) sync* {
    for (int i = 0; i < childs.length; i++) {
      yield Container(
        height: 60,
        margin: EdgeInsets.only(left: 30),
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("${childs[i]["head"]}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "${childs[i]["nickname"]}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "${childs[i]["motto"]}",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ),
              ],
            ))
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController?.dispose();
  }
}
