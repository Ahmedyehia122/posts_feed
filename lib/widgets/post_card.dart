import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:posts_feed/models/post_model.dart';
import 'package:posts_feed/widgets/photo_example.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.post,
  });
  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                widget.post.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: widget.post.imagePath != null
                  ? Image.file(
                      File(widget.post.imagePath ?? ''),
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )
                  : const PhotoExample(),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                widget.post.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    icon: isSelected
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border_outlined),
                    color: Colors.red,
                  ),
                  SizedBox(width: 16.w),
                  const Icon(
                    Icons.comment,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 16.w),
                  const Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
