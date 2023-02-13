import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:grahnumb_task/core/blog_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.blog}) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(
                width: screenSize.width,
                height: screenSize.height/2,
                child: CachedNetworkImage(
                  imageUrl: blog.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenSize.width,
                child: Html(
                  data: blog.text,
                  onLinkTap: (url, _, __, ___) async {
                    if(url!=null){
                      final url1 = Uri.parse(url);
                      if (await canLaunchUrl(url1)) {
                        await launchUrl(url1);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
