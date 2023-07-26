import 'dart:convert';

import 'package:http/http.dart' as http;

import 'all_news_app.dart';
class AllNewsRepo {
  Future<AllNewsModel?> getResponse() async {
    try{
      var response = await http.get(
          Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f003149754474f69aa5b39a271ddacf3"));
      Map<String,dynamic> deCodeResponse = json.decode(response.body);
      if(response.statusCode == 200){
        AllNewsModel data = AllNewsModel.fromJson(deCodeResponse);
       return data;
      } else {
        print("Request Field");
      }
    }catch(error){
      print("error $error");
    }
  }
}