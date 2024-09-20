import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_feed/widgets/add_posts_view_app_bar.dart';
import 'package:posts_feed/widgets/custom_button.dart';
import 'package:posts_feed/widgets/custom_text.dart';
import 'package:posts_feed/widgets/custom_text_field.dart';
import 'package:posts_feed/widgets/photo_example.dart';

class AddPostsView extends StatelessWidget {
  const AddPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddPostsViewAppBar(),
              SizedBox(height: 16.h),
              PhotoExample(
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              const CustomText(text: 'Title'),
              SizedBox(height: 8.h),
              const CustomTextField(),
              SizedBox(height: 16.h),
              const CustomText(text: 'Description'),
              SizedBox(height: 8.h),
              const CustomTextField(),
              SizedBox(height: 40.h),
              CustomButton(
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
