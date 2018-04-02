import 'package:flutter_movies/helpers/custom-route.dart';
import 'package:flutter_movies/pages/home.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String defaultPageRoute ="/";
  static const String homePageRoute ="/home";
  static const String aboutPageRoute ="/about";
  static const String favPageRoute ="/favourite";
  static const String newsPageRoute ="/news";
  static const String calendarPageRoute ="/calendar";
  static const String userPageRoute ="/about";


static getRoutes(){
   return (RouteSettings settings){
      switch(settings.name){
        case Routes.homePageRoute : 
        return new MyCustomRoute(settings: settings,builder: (_)=>new HomePage());
        case  Routes.aboutPageRoute:
        return new MyCustomRoute(settings: settings,builder: (_)=>new HomePage());
        case Routes.favPageRoute :
        return new MyCustomRoute(settings: settings, builder: (_) =>  new HomePage());
        // return (BuildContext context)=> new FavouritePage();
      }
   };
}


}

class MyRoute extends Route{
 static Route getRoute(){
   return new MyRoute();
 } 
}