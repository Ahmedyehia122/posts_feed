import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_feed/app.dart';
import 'package:posts_feed/models/post_model.dart';
import 'package:posts_feed/core/consts.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());

  await Hive.openBox<PostModel>(Consts.postsBox);

  runApp(const PostsFeedApp());
}
