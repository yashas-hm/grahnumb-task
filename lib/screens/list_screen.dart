import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grahnumb_task/controller/controller.dart';
import 'package:grahnumb_task/core/blog_model.dart';
import 'package:grahnumb_task/screens/details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final controller = Get.find<BlogController>();
  final scrollController = ScrollController();
  late double scroll;

  @override
  void initState() {
    controller.getData();
    scroll = scrollController.initialScrollOffset;
    scrollController.addListener(() {
      scroll = scrollController.offset;
      if (scrollController.position.maxScrollExtent <=
          scrollController.offset) {
        controller.getData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF3EEC9),
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: GetBuilder(
        init: controller,
        id: 'blogsList',
        builder: (ctr) => SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: ListView.builder(
            controller: scrollController,
            physics:const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(13),
            itemBuilder: (ctx, index) => ListItem(
              blog: controller.blogs[index],
            ),
            itemCount: controller.blogs.length,
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.blog}) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(DetailsScreen(blog: blog,)),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Material(
          elevation: 15,
          child: Container(
            height: screenSize.height / 1.8,
            width: screenSize.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      child: const CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('Author'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox(
                    width: screenSize.width,
                    child: CachedNetworkImage(
                      imageUrl: blog.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: screenSize.width,
                  child: Text(
                    blog.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
