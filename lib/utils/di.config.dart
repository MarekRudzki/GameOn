// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/game_details_screen/data/datasources/game_details_remote_data_source.dart'
    as _i3;
import '../features/game_details_screen/domain/repositories/game_details_repository.dart'
    as _i4;
import '../features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart'
    as _i11;
import '../features/genre_games/data/datasources/genre_games_remote_data_source.dart'
    as _i5;
import '../features/genre_games/domain/repositories/genre_games_repository.dart'
    as _i6;
import '../features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart'
    as _i12;
import '../features/genres/data/datasources/genres_remote_data_source.dart'
    as _i7;
import '../features/genres/domain/repositories/genres_repository.dart' as _i8;
import '../features/genres/presentation/bloc/genres_bloc/genres_bloc.dart'
    as _i13;
import '../features/search/data/datasources/search_remote_data_source.dart'
    as _i9;
import '../features/search/domain/repositories/search_repository.dart' as _i10;
import '../features/search/presentation/bloc/search_bloc/search_bloc.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.GameDetailsRemoteDataSource>(
        () => _i3.GameDetailsRemoteDataSource());
    gh.lazySingleton<_i4.GameDetailsRepository>(() => _i4.GameDetailsRepository(
        gameDetailsRemoteDataSource: gh<_i3.GameDetailsRemoteDataSource>()));
    gh.lazySingleton<_i5.GenreGamesRemoteDataSource>(
        () => _i5.GenreGamesRemoteDataSource());
    gh.lazySingleton<_i6.GenreGamesRepository>(() => _i6.GenreGamesRepository(
        genreGamesRemoteDataSource: gh<_i5.GenreGamesRemoteDataSource>()));
    gh.lazySingleton<_i7.GenresRemoteDataSource>(
        () => _i7.GenresRemoteDataSource());
    gh.lazySingleton<_i8.GenresRepository>(() => _i8.GenresRepository(
        genresRemoteDataSource: gh<_i7.GenresRemoteDataSource>()));
    gh.lazySingleton<_i9.SearchRemoteDataSource>(
        () => _i9.SearchRemoteDataSource());
    gh.lazySingleton<_i10.SearchRepository>(() => _i10.SearchRepository(
        searchRemoteDataSource: gh<_i9.SearchRemoteDataSource>()));
    gh.factory<_i11.GameDetailsBloc>(() => _i11.GameDetailsBloc(
        gameDetailsRepository: gh<_i4.GameDetailsRepository>()));
    gh.factory<_i12.GenreGamesBloc>(() => _i12.GenreGamesBloc(
        genreGamesRepository: gh<_i6.GenreGamesRepository>()));
    gh.factory<_i13.GenresBloc>(
        () => _i13.GenresBloc(genresRepository: gh<_i8.GenresRepository>()));
    gh.factory<_i14.SearchBloc>(
        () => _i14.SearchBloc(searchRepository: gh<_i10.SearchRepository>()));
    return this;
  }
}
