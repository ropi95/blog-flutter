
import 'package:flutter_application_1/src/core/data/datasource/remote/remote_datasource.dart';
import 'package:flutter_application_1/src/core/data/models/blog_model.dart';
import 'package:flutter_application_1/src/core/domain/repositories/blog_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BlogRepository)
class BlogRepositoryImpl implements BlogRepository {
  final RemoteDatasource remoteDatasource;

  BlogRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<List<BlogModel>> getBlog() async {
    final response = await remoteDatasource.getBlog();
    final list = response as List;
    final dataResult = list.map((i) {
      return BlogModel.fromJson(i);
    }).toList();
    return dataResult;
  }
}
