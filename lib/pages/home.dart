import 'package:flutter/material.dart';
import 'package:flutter_movies/constants/strings.dart';
import 'package:flutter_movies/data/network.dart';



class HomePage extends StatefulWidget{
  @override
  State createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage>{


  void init(){
    MyNetwork.getRequest(MyNetwork.MOVIES_URL).then(
      (res) {
        setState((){
          print(res);
        });
      }
    );
  }

  _buildHomePage(){
    return new Center(
      child: new Text(
        "Hello World "
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(HOME_TITLE),
      ),
      body: _buildHomePage(),
    );
  }

}