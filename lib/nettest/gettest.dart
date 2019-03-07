import 'package:flutter/material.dart';

class GetTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '登陆页面',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('测试get请求'),
        ),
        body:Text('测试'),
      ),
    );
  }
}