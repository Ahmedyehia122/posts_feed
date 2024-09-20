import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_feed/blocs/theme_bloc/theme_bloc.dart';
import 'package:posts_feed/blocs/theme_bloc/theme_event.dart';
import 'package:posts_feed/blocs/theme_bloc/theme_state.dart';
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
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              bool isLightTheme = state is ThemeLightState;
              return GestureDetector(
                onTap: () {
                  // Trigger the theme toggle event
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
                child: Icon(
                  isLightTheme ? Icons.dark_mode : Icons.light_mode,
                  color: isLightTheme ? Colors.amber : Colors.grey,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
