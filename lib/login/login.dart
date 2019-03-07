import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '登陆页面',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('企鹅电竞布局测试一'),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index==0 ? buildHeader(context) : buildLoginItem(context);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context){
  return Column(
    children: <Widget>[
      Image.asset(
        'images/timg.jpeg',
        width: double.infinity,
        fit: BoxFit.contain,
      ),
      Text(
          '头部信息'
      ),
    ],
  );
}

Widget buildLoginItem(BuildContext context) {
  return Column(
    children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
            alignment: Alignment.centerLeft,
            child: Text('直播推荐'),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 5, 15, 5),
            alignment: Alignment.centerRight,
            child: Text('刷新'),
          ),
        )
      ]),
      Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/outstanding.jpeg',
                  width: double.infinity,
                  height: 126.6,
                ),
                Text('新晋主播，多多关照')
              ],
            ),
          )),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/outstanding.jpeg',
                  width: double.infinity,
                  height: 126.6,
                ),
                Text('国服李白，了解一下')
              ],
            ),
          ))
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/outstanding.jpeg',
                  width: double.infinity,
                  height: 126.6,
                ),
                Text('貂蝉教你五杀')
              ],
            ),
          )),
          Expanded(
              child: Container(
            padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/outstanding.jpeg',
                  width: double.infinity,
                  height: 126.6,
                ),
                Text('国服最骚香香')
              ],
            ),
          ))
        ],
      )
    ],
  );
}
