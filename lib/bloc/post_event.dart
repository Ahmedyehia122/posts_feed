import 'package:equatable/equatable.dart';
import 'package:posts_feed/models/post_model.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

// Event to load posts
class LoadPostsEvent extends PostEvent {}

// Event to add a post
class AddPostEvent extends PostEvent {
  final PostModel post;

  const AddPostEvent(this.post);

  @override
  List<Object?> get props => [post];
}
