import 'package:flutter/material.dart';
import 'package:test9/repository/dummy_data.dart';
import 'package:test9/views/widgets/post_widget.dart';

class LikedPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.where((element) => element.isFavourite).length,
        itemBuilder: (context, index) {
          return PostWidget(
              posts.where((element) => element.isFavourite).toList()[index]);
        });
  }
}
