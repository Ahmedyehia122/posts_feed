import 'package:flutter/material.dart';
import 'package:posts_feed/widgets/custom_app_bar_title.dart';

class AddPostsViewAppBar extends StatelessWidget {
  const AddPostsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
        ),
        const CustomAppBarTitle(title: 'Add a post'),
        const SizedBox(),
      ],
    );
  }
}
