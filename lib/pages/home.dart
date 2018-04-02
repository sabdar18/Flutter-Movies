import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movies/components/drawer.dart';
import 'package:flutter_movies/constants/strings.dart';
import 'package:flutter_movies/data/network.dart';

import '../data/models.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String response;
  List<String> appBarItems = AppBarData.getAppBarList();

  List list = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    print('init');
    MyNetwork.getRequest(MyNetwork.MOVIES_URL).then((res) {
      setState(() {
        this.list = json.decode(res)['results'];
      });
    });
  }

  _buildMovieCard(item) {
    return new ListTile(
      leading: new CircleAvatar(
          child: new Image(
              image: new NetworkImage(
                  MyNetwork.IMAGE_SIZE_ORIGINAL + item['poster_path']))),
      title: new Text(item['title']),
    );
  }

  _buildHomePage() {
    return new Center(
        child: new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new Container(
            child: new Column(
          children: <Widget>[_buildMovieCard(list[index])],
        ));
      },
      itemCount: list.length,
      scrollDirection: Axis.vertical,
    ));
  }

  _buildTvPage() {
    return new Center(
      child: new Text("TV"),
    );
  }

  _buildMusicPage() {
    return new Center(
      child: new Text("MUSIC"),
    );
  }

  _buildLanguagesPage() {
    return new Center(
      child: new Text("LANGUAGES"),
    );
  }

  _buildClipsPage() {
    return new Center(
      child: new Text("CLIPS"),
    );
  }

  _buildGenrePage() {
    return new Center(
      child: new Text("GENRE"),
    );
  }

  _showSearch() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        child: new AlertDialog(
          title: new Text('Search Alert'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("hello Search"),
                new Text("hello Search"),
                new Text("hello Search"),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("DISMISS"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: appBarItems.length,
      child: new Scaffold(
        appBar: new AppBar(
            title: new Text(HOME_TITLE),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(
                icon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _showSearch();
                },
              )
            ],
            bottom: new TabBar(
                isScrollable: true,
                tabs: appBarItems.map((res) {
                  return new Tab(
                    text: res,
                  );
                }).toList())),
        body: new TabBarView(
          children: <Widget>[
            _buildHomePage(),
            _buildTvPage(),
            _buildMusicPage(),
            _buildLanguagesPage(),
            _buildClipsPage(),
            _buildGenrePage(),
          ],
        ),
        drawer: new MyDrawer(),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: getData,
        ),
      ),
    );
  }
}
