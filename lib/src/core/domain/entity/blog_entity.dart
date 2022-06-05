import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const BlogEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [id, userId, title, body];
}
