import 'dart:convert';
import 'dart:developer';

import 'package:grahnumb_task/core/blog_model.dart';
import 'package:http/http.dart' as http;

class AppHelper{
  static Future<List<Blog>> getData(int page) async{
    String dataUrl = 'https://techcrunch.com/wp-json/wp/v2/posts?per_page=3&page=$page';
    List<Blog> blogs = [];

    try{
      final http.Response data = await http.get(Uri.parse(dataUrl));
      final result = json.decode(data.body) as List;

      for(var data in result){
        blogs.add(Blog.fromJson(data));
      }

    }catch(e){
      log(e.toString());
    }

    return blogs;
  }
}