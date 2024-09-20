import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_feed/blocs/posts_bloc/post_bloc.dart';
import 'package:posts_feed/blocs/posts_bloc/post_state.dart';
import 'package:posts_feed/widgets/post_card.dart';
import 'package:posts_feed/widgets/posts_view_app_bar.dart';
import 'package:posts_feed/widgets/custom_add_post_button.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomAddPostButton(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              const PostsViewAppBar(),
              Expanded(
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PostsLoaded) {
                      if (state.posts.isEmpty) {
                        return const Center(child: Text("No posts available"));
                      }
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: PostCard(post: state.posts[index]),
                          );
                        },
                      );
                    } else if (state is PostsError) {
                      return Center(child: Text(state.error));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
