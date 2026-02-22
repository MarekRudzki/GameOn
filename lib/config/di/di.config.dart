// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Package imports:
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// Project imports:
import '../../features/genres/data/repositories/genres_repository.dart' as _i75;

import '../../features/favorites/data/datasources/favorites_local_data_source.dart'
    as _i654;
import '../../features/favorites/data/datasources/favorites_remote_data_source.dart'
    as _i567;
import '../../features/favorites/data/repositories/favorites_repository.dart'
    as _i485;
import '../../features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart'
    as _i218;
import '../../features/game_details/data/datasources/game_details_remote_data_source.dart'
    as _i871;
import '../../features/game_details/data/repositories/game_details_repository.dart'
    as _i790;
import '../../features/game_details/presentation/bloc/game_details_bloc/game_details_bloc.dart'
    as _i147;
import '../../features/genre_games/data/datasources/genre_games_remote_data_source.dart'
    as _i293;
import '../../features/genre_games/data/repositories/genre_games_repository.dart'
    as _i85;
import '../../features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart'
    as _i205;
import '../../features/genres/data/datasources/genres_remote_data_source.dart'
    as _i223;
import '../../features/genres/presentation/bloc/genres_bloc/genres_bloc.dart'
    as _i421;
import '../../features/search/data/datasources/search_remote_data_source.dart'
    as _i280;
import '../../features/search/data/repositories/search_repository.dart'
    as _i708;
import '../../features/search/presentation/bloc/search_bloc/search_bloc.dart'
    as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i654.FavoritesLocalDataSource>(
      () => _i654.FavoritesLocalDataSource(),
    );
    gh.lazySingleton<_i567.FavoritesRemoteDataSource>(
      () => _i567.FavoritesRemoteDataSource(),
    );
    gh.lazySingleton<_i871.GameDetailsRemoteDataSource>(
      () => _i871.GameDetailsRemoteDataSource(),
    );
    gh.lazySingleton<_i293.GenreGamesRemoteDataSource>(
      () => _i293.GenreGamesRemoteDataSource(),
    );
    gh.lazySingleton<_i223.GenresRemoteDataSource>(
      () => _i223.GenresRemoteDataSource(),
    );
    gh.lazySingleton<_i280.SearchRemoteDataSource>(
      () => _i280.SearchRemoteDataSource(),
    );
    gh.lazySingleton<_i485.FavoritesRepository>(
      () => _i485.FavoritesRepository(
        remoteDataSource: gh<_i567.FavoritesRemoteDataSource>(),
        localDataSource: gh<_i654.FavoritesLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i790.GameDetailsRepository>(
      () => _i790.GameDetailsRepository(
        remoteDataSource: gh<_i871.GameDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i147.GameDetailsBloc>(
      () =>
          _i147.GameDetailsBloc(repository: gh<_i790.GameDetailsRepository>()),
    );
    gh.factory<_i218.FavoritesBloc>(
      () => _i218.FavoritesBloc(repository: gh<_i485.FavoritesRepository>()),
    );
    gh.lazySingleton<_i708.SearchRepository>(
      () => _i708.SearchRepository(
        remoteDataSource: gh<_i280.SearchRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i85.GenreGamesRepository>(
      () => _i85.GenreGamesRepository(
        remoteDataSource: gh<_i293.GenreGamesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i75.GenresRepository>(
      () => _i75.GenresRepository(
        remoteDataSource: gh<_i223.GenresRemoteDataSource>(),
      ),
    );
    gh.factory<_i421.GenresBloc>(
      () => _i421.GenresBloc(repository: gh<_i75.GenresRepository>()),
    );
    gh.factory<_i211.SearchBloc>(
      () => _i211.SearchBloc(repository: gh<_i708.SearchRepository>()),
    );
    gh.factory<_i205.GenreGamesBloc>(
      () => _i205.GenreGamesBloc(
        genreGamesRepository: gh<_i85.GenreGamesRepository>(),
      ),
    );
    return this;
  }
}
