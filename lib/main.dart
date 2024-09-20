import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:posts_feed/app.dart';
import 'package:posts_feed/models/post_model.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());
  runApp(
    const PostsFeedApp(),
  );
}
