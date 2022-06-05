part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class GetBlog extends BlogEvent {}

class SearchBlog extends BlogEvent {
  final String searchValue;
  final List<BlogEntity> allBlogs;

  const SearchBlog({
    required this.searchValue,
    required this.allBlogs,
  });
}
