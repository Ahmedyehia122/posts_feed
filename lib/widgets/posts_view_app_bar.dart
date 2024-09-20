import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_feed/widgets/custom_app_bar_title.dart';

class PostsViewAppBar extends StatelessWidget {
  const PostsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const CustomAppBarTitle(title: 'Posts'),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.light_mode,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
