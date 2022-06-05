import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';

class BlogModel extends BlogEntity {
  const BlogModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );
  factory BlogModel.fromJson(Map json) {
    return BlogModel(
      userId: json['userId'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
