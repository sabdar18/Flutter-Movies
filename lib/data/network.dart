import 'dart:async';

import 'dart:io';



  class MyNetwork{

   static const String AUTH_KEY ="badbe44c20d17a6b61780548da2adbd8";
   static const String BASE_URL = "https://api.themoviedb.org/3/";

   //Discover service
   static const String DISCOVER_URL = BASE_URL +'discover/';
   static const String MOVIES_URL = DISCOVER_URL + 'movie';
  //configuration service
   static const String CONFIG_URL = BASE_URL +'configuration/';
   static const String LANGUAGES_URL =  CONFIG_URL + "languages";
   static const String COUNTRIES_URL = CONFIG_URL +'countries';

  //Images services
   static const String IMAGE_PATH = "https://image.tmdb.org/t/p/";
   static const String IMAGE_SIZE_W500 = IMAGE_PATH+ "w500/";
   static const String IMAGE_SIZE_ORIGINAL = IMAGE_PATH +"original/";

  static Future<List> getRequest(String urlString) async{
    String url = urlString + "?api_key=" + AUTH_KEY ;
     var httpClient = new HttpClient();
     var request = await httpClient.getUrl(Uri.parse(url));
     var response = request.close();
    return response.asStream().toList();
  }
 
  

  
}