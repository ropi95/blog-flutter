import 'package:flutter_application_1/src/core/data/models/blog_model.dart';

abstract class BlogRepository {
  Future<List<BlogModel>> getBlog();
}
