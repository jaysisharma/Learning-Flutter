import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listview/PostModel.dart';

class ApiService {
  static const String url = "https://jsonplaceholder.typicode.com/posts/";

  Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonRespone = jsonDecode(response.body);
      return jsonRespone.map((post) => Posts.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
