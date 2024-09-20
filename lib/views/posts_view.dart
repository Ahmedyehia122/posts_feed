import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_feed/widgets/post_card.dart';
import 'package:posts_feed/widgets/posts_view_app_bar.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Column(
            children: [
              const PostsViewAppBar(),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: const PostCard()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
