class Blog {
  String id;

  String text;

  String imageUrl;

  String title;

  static Blog fromJson(Map<String, dynamic> data) {
    return Blog(
      id: data["id"].toString(),
      imageUrl: data["jetpack_featured_media_url"].toString(),
      text: data["content"]["rendered"].toString(),
      title: data["title"]["rendered"].toString(),
    );
  }

  Blog({
    required this.id,
    required this.text,
    required this.imageUrl,
    required this.title,
  });
}
