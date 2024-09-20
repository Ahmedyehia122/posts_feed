import 'package:equatable/equatable.dart';
import 'package:posts_feed/models/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

// Initial state
class PostInitial extends PostState {}

// State when posts are being loaded
class PostsLoading extends PostState {}

// State when posts are loaded successfully
class PostsLoaded extends PostState {
  final List<PostModel> posts;

  const PostsLoaded(this.posts);

  @override
  List<Object?> get props => [posts];
}

// State when there's an error loading posts
class PostsError extends PostState {
  final String error;

  const PostsError(this.error);

  @override
  List<Object?> get props => [error];
}
