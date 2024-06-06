class Posts {
  final String id;
  final String Title;
  final String Desc;

  Posts({required this.Title, required this.id, required this.Desc});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(Title: json['title'], id: json['id'], Desc: json['body']);
  }
}
