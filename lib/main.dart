import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posts_feed/bloc/post_bloc.dart';
import 'package:posts_feed/bloc/post_event.dart';
import 'package:posts_feed/models/post_model.dart';
import 'package:posts_feed/views/posts_view.dart';
import 'package:posts_feed/core/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Initialize Hive and register the adapter for PostModel
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());

  // Open the Hive box where posts will be stored
  await Hive.openBox<PostModel>(Consts.postsBox);

  runApp(const PostsFeedApp());
}

class PostsFeedApp extends StatelessWidget {
  const PostsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) =>
            PostBloc()..add(LoadPostsEvent()), // Initialize BLoC
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const PostsView(), // The main view showing the posts
        ),
      ),
    );
  }
}
