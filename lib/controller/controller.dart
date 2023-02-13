import 'package:get/get.dart';
import 'package:grahnumb_task/core/app_helper.dart';
import 'package:grahnumb_task/core/blog_model.dart';

class BlogController extends GetxController{
  bool loading = false;
  List<Blog> blogs = [];
  int page = 1;

  Future<void> getData() async {
    loading = true;
    update(['blogsList']);
    final data = await AppHelper.getData(page);

    blogs.addAll(data);

    page+=1;
    loading = false;
    update(['blogsList']);
  }
}