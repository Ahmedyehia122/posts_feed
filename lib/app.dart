import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_feed/blocs/posts_bloc/post_bloc.dart';
import 'package:posts_feed/blocs/posts_bloc/post_event.dart';
import 'package:posts_feed/blocs/theme_bloc/theme_bloc.dart';
import 'package:posts_feed/blocs/theme_bloc/theme_state.dart';
import 'package:posts_feed/views/posts_view.dart';

class PostsFeedApp extends StatelessWidget {
  const PostsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostBloc()..add(LoadPostsEvent()),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state is ThemeLightState
                  ? state.themeData
                  : ThemeData(brightness: Brightness.light),
              darkTheme: state is ThemeDarkState
                  ? state.themeData
                  : ThemeData(brightness: Brightness.dark),
              themeMode:
                  state is ThemeLightState ? ThemeMode.light : ThemeMode.dark,
              home: const PostsView(),
            );
          },
        ),
      ),
    );
  }
}
