
import 'package:flutter/material.dart';
import 'package:test9/models/post_model.dart';
import 'package:test9/views/screens/all_posts.dart';
import 'package:test9/views/screens/favourite_screen.dart';

class MainSocialAppScreen extends StatefulWidget {
  @override
  State<MainSocialAppScreen> createState() => _MainSocialAppScreenState();
}

class _MainSocialAppScreenState extends State<MainSocialAppScreen> {
  checkTask(PostModel postModel) {
    setState(() {
      postModel.isFavourite = !postModel.isFavourite;
    });
  }
  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Social Media App')),
      body: PageView(
          controller: pageController,
          children: [AllPostsScreen(checkTask), LikedPostsScreen(checkTask)]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
            pageController.animateToPage(index,
                duration: Duration(microseconds: 100), curve: Curves.linear);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
          ]),
    );
  }
}
