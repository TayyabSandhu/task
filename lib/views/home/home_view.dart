import 'package:flutter/material.dart';
import 'package:task/utils/sizes.dart';
import 'package:task/views/home/post_view.dart';
import 'package:task/views/home/stories_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const PostView(),
          Positioned(
            top: statusBarHeight + 24.0,
            width: context.screenWidth,
            child: const SizedBox(
              height: 76.0,
              child: StoriesView(),
            ),
          ),
        ],
      ),
    );
  }
}
