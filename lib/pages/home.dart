import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movies/components/drawer.dart';
import 'package:flutter_movies/constants/strings.dart';
import 'package:flutter_movies/data/network.dart';



class HomePage extends StatefulWidget{
  @override
  State createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  String response;

  List list = [];
  @override
  void initState(){
    super.initState();
    getData();
  }
  getData(){
     print('init');
    MyNetwork.getRequest(MyNetwork.MOVIES_URL).then((res){
      setState((){
        this.list = json.decode(res)['results'];
      });
    });
  }

  _buildMovieCard(item){
    return new ListTile(
      leading: new CircleAvatar(
          child: new Image(
          image:  new NetworkImage(MyNetwork.IMAGE_SIZE_ORIGINAL+item['poster_path'])
          )
        ),
      title: new Text(item['title']),
    );
  }
  _buildHomePage(){
    return new Center(
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return new Container(
            child: new Column(
            children: <Widget>[
              _buildMovieCard(list[index])
            ],
          )
          );
        },
        itemCount: list.length,
        scrollDirection: Axis.vertical,
      ) 
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(HOME_TITLE),
      ),
      body: _buildHomePage(),
      drawer: new MyDrawer(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: getData,
      ),
    );
  }

}