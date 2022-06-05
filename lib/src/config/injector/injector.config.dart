// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/data/datasource/remote/remote_datasource.dart' as _i3;
import '../../core/data/repositories/blog_repository_impl.dart' as _i5;
import '../../core/domain/repositories/blog_repository.dart' as _i4;
import '../../core/domain/usecase/blog_usecase.dart' as _i6;
import '../../presentation/views/blog/bloc/blog_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.RemoteDatasource>(() => _i3.RemoteDatasourceImpl());
  gh.lazySingleton<_i4.BlogRepository>(() =>
      _i5.BlogRepositoryImpl(remoteDatasource: get<_i3.RemoteDatasource>()));
  gh.lazySingleton<_i6.BlogUseCase>(
      () => _i6.BlogUseCase(blogRepository: get<_i4.BlogRepository>()));
  gh.factory<_i7.BlogBloc>(() => _i7.BlogBloc(get<_i6.BlogUseCase>()));
  return get;
}
