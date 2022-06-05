import 'package:flutter_application_1/src/core/domain/entity/blog_entity.dart';
import 'package:flutter_application_1/src/core/domain/repositories/blog_repository.dart';
import 'package:flutter_application_1/src/core/utils/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BlogUseCase implements UseCase<List<BlogEntity>, NoParam> {
  BlogRepository blogRepository;
  BlogUseCase({required this.blogRepository});

  @override
  Future<List<BlogEntity>> call(NoParam noParam) async {
    return blogRepository.getBlog();
  }
}
