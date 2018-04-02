import 'package:flutter/material.dart';
import 'package:flutter_movies/routes.dart';



class MenuItem{
  MenuItem(this.title, this.icon, this.route,this.selected, this.enabled);

  final String title;
  final Icon icon;
  final String route;
  bool selected  ;
   bool enabled;
}


class MenuData {

  static List<MenuItem> menuItems = new List<MenuItem>();

  static _initMenu(){
   menuItems.add(new MenuItem("Home", new Icon(Icons.home), Routes.homePageRoute,true,true));
   menuItems.add(new MenuItem("Favourite", new Icon(Icons.favorite), Routes.favPageRoute,false,true));
   menuItems.add(new MenuItem("News", new Icon(Icons.new_releases), Routes.newsPageRoute,false,true));
   menuItems.add(new MenuItem("Calender", new Icon(Icons.calendar_today),Routes.calendarPageRoute,false,true));
   menuItems.add(new MenuItem("About", new Icon(Icons.dashboard),Routes.aboutPageRoute,false,true));
   menuItems.add(new MenuItem("User", new Icon(Icons.person),Routes.userPageRoute,false,true));
  }
  static List<MenuItem> getMenuList(){
    if(menuItems.length ==0) _initMenu();
    return menuItems;
  }

}