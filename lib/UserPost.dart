import 'package:flutter/material.dart';
import 'package:listview/FetchData.dart';
import 'package:listview/PostModel.dart';

class UserPost extends StatelessWidget {
  final ApiService _api = ApiService();
  UserPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Posts>>(
            future: _api.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text("No Data Available"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Posts posts = snapshot.data![index];
                      return ListTile(
                        leading: Text(posts.id.toString()),
                        title: Text(posts.Title),
                        subtitle: Text(posts.Desc),
                      );
                    });
              }
            }));
  }
}
