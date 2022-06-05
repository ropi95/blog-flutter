import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';
import 'package:flutter_application_1/src/core/domain/usecase/blog_usecase.dart';
import 'package:flutter_application_1/src/core/utils/usecase.dart';
import 'package:injectable/injectable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

@injectable
class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogUseCase blogUseCase;
  BlogBloc(this.blogUseCase) : super(BlogInitial()) {
    on<BlogEvent>(
      (event, emit) async {
        if (event is GetBlog) {
          emit(BlogLoading());
          final result = await blogUseCase.call(NoParam());
          emit(BlogLoaded(result));
        }
        if (event is SearchBlog) {
          emit(BlogLoading());
          final result = event.allBlogs
              .where((element) => element.title.contains(event.searchValue))
              .toSet()
              .toList();
          emit(SearchBlogLoaded(result, event.allBlogs));
        }
      },
    );
  }
}
