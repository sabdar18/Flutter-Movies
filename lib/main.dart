import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/home.dart';


void main() => runApp(new MyApp());


class MyApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hello Movies",
      home: new HomePage(),
      // debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(primaryColor: Colors.pink),
    );
  }
}