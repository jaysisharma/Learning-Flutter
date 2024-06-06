class Posts {
  final int id;
  final String Title;
  final String Desc;

  Posts({required this.id, required this.Title, required this.Desc});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(Title: json['title'], id: json['id'], Desc: json['body']);
  }
}
