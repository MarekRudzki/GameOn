// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/favorites/data/datasources/favorites_local_data_source.dart'
    as _i3;
import '../features/favorites/data/datasources/favorites_remote_data_source.dart'
    as _i4;
import '../features/favorites/domain/repositories/favorites_repository.dart'
    as _i5;
import '../features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart'
    as _i14;
import '../features/game_details_screen/data/datasources/game_details_remote_data_source.dart'
    as _i6;
import '../features/game_details_screen/domain/repositories/game_details_repository.dart'
    as _i7;
import '../features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart'
    as _i15;
import '../features/genre_games/data/datasources/genre_games_remote_data_source.dart'
    as _i8;
import '../features/genre_games/domain/repositories/genre_games_repository.dart'
    as _i9;
import '../features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart'
    as _i16;
import '../features/genres/data/datasources/genres_remote_data_source.dart'
    as _i10;
import '../features/genres/domain/repositories/genres_repository.dart' as _i11;
import '../features/genres/presentation/bloc/genres_bloc/genres_bloc.dart'
    as _i17;
import '../features/search/data/datasources/search_remote_data_source.dart'
    as _i12;
import '../features/search/domain/repositories/search_repository.dart' as _i13;
import '../features/search/presentation/bloc/search_bloc/search_bloc.dart'
    as _i18;

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
    gh.lazySingleton<_i3.FavoritesLocalDataSource>(
        () => _i3.FavoritesLocalDataSource());
    gh.lazySingleton<_i4.FavoritesRemoteDataSource>(
        () => _i4.FavoritesRemoteDataSource());
    gh.lazySingleton<_i5.FavoritesRepository>(() => _i5.FavoritesRepository(
          favoritesRemoteDataSource: gh<_i4.FavoritesRemoteDataSource>(),
          favoritesLocalDataSource: gh<_i3.FavoritesLocalDataSource>(),
        ));
    gh.lazySingleton<_i6.GameDetailsRemoteDataSource>(
        () => _i6.GameDetailsRemoteDataSource());
    gh.lazySingleton<_i7.GameDetailsRepository>(() => _i7.GameDetailsRepository(
        gameDetailsRemoteDataSource: gh<_i6.GameDetailsRemoteDataSource>()));
    gh.lazySingleton<_i8.GenreGamesRemoteDataSource>(
        () => _i8.GenreGamesRemoteDataSource());
    gh.lazySingleton<_i9.GenreGamesRepository>(() => _i9.GenreGamesRepository(
        genreGamesRemoteDataSource: gh<_i8.GenreGamesRemoteDataSource>()));
    gh.lazySingleton<_i10.GenresRemoteDataSource>(
        () => _i10.GenresRemoteDataSource());
    gh.lazySingleton<_i11.GenresRepository>(() => _i11.GenresRepository(
        genresRemoteDataSource: gh<_i10.GenresRemoteDataSource>()));
    gh.lazySingleton<_i12.SearchRemoteDataSource>(
        () => _i12.SearchRemoteDataSource());
    gh.lazySingleton<_i13.SearchRepository>(() => _i13.SearchRepository(
        searchRemoteDataSource: gh<_i12.SearchRemoteDataSource>()));
    gh.factory<_i14.FavoritesBloc>(
        () => _i14.FavoritesBloc(gh<_i5.FavoritesRepository>()));
    gh.factory<_i15.GameDetailsBloc>(() => _i15.GameDetailsBloc(
        gameDetailsRepository: gh<_i7.GameDetailsRepository>()));
    gh.factory<_i16.GenreGamesBloc>(() => _i16.GenreGamesBloc(
        genreGamesRepository: gh<_i9.GenreGamesRepository>()));
    gh.factory<_i17.GenresBloc>(
        () => _i17.GenresBloc(genresRepository: gh<_i11.GenresRepository>()));
    gh.factory<_i18.SearchBloc>(
        () => _i18.SearchBloc(searchRepository: gh<_i13.SearchRepository>()));
    return this;
  }
}
