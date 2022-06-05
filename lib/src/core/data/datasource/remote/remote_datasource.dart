import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class RemoteDatasource {
  Future<T> getBlog<T>();
}

@LazySingleton(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  RemoteDatasourceImpl();

  @override
  Future<T> getBlog<T>() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/posts',
      ),
    );
    return json.decode(response.body);
  }
}
