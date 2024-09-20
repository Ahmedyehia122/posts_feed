import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_feed/bloc/post_event.dart';
import 'package:posts_feed/bloc/post_state.dart';
import 'package:hive/hive.dart';
import 'package:posts_feed/models/post_model.dart';
import 'package:posts_feed/core/consts.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<AddPostEvent>(_onAddPost);
  }

  void _onLoadPosts(LoadPostsEvent event, Emitter<PostState> emit) async {
    emit(PostsLoading());
    try {
      var postsBox = Hive.box<PostModel>(Consts.postsBox);
      List<PostModel> posts = postsBox.values.toList();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(const PostsError("Failed to load posts"));
    }
  }

  void _onAddPost(AddPostEvent event, Emitter<PostState> emit) async {
    try {
      var postsBox = Hive.box<PostModel>(Consts.postsBox);
      await postsBox.add(event.post);

      // Re-fetch posts after adding
      List<PostModel> posts = postsBox.values.toList();
      print("Posts: ${posts.length}"); // Debug: Check if posts are added
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(const PostsError("Failed to add post"));
    }
  }
}
