part of 'blog_bloc.dart';

abstract class BlogState {
  const BlogState();
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<BlogEntity> blogs;

  const BlogLoaded(this.blogs);
}

class SearchBlogLoaded extends BlogState {
  final List<BlogEntity> blogs;
  final List<BlogEntity> allBlogs;

  const SearchBlogLoaded(this.blogs, this.allBlogs);
}
