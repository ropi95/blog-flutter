import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/views/blog/bloc/blog_bloc.dart';
import 'package:flutter_application_1/src/presentation/views/blog/blog_screen.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    final bloc = GetIt.instance<BlogBloc>();
    switch (settings.name) {
      case '/':
        return _materialRoute(
          BlogScreen(
            bloc: bloc,
          ),
        );

      default:
        return _materialRoute(BlogScreen(
          bloc: bloc,
        ));
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
