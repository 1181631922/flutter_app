import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'login/login.dart';
import 'nettest/gettest.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String,WidgetBuilder>{
      'login':(BuildContext context)=>new LoginWidget(),
      'gettest':(BuildContext context)=>new GetTestWidget(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter入门学习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter入门学习'),
        ),
        body: Container(
          child: buildRows(context),
        ),
      ),
    );
  }

  Widget buildRows(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginWidget()));
          },
          child: buildItemLayout('第一行'),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetTestWidget()));
          },
          child: buildItemLayout('第二行'),
        ),
        buildItemLayout('第三行'),
        Icon(
          Icons.map,
        ),
      ],
    );
  }

  Widget buildItemLayout(String label) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 8, 8, 15),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/ic_launcher.png',
            width: 30,
            height: 30,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: new TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
      height: 50,
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo程序'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
