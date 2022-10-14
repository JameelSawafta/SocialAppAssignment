import 'package:flutter/material.dart';
import 'package:test9/repository/dummy_data.dart';
import 'package:test9/views/widgets/post_widget.dart';

class AllPostsScreen extends StatelessWidget {
  Function function;
  AllPostsScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(posts[index], function);
        });
  }
}
