import 'package:hive/hive.dart';
part 'post_model.g.dart';

@HiveType(typeId: 1)
class PostModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? imagePath;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;

  PostModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.description});
}
