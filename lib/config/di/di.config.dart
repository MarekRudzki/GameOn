// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/favorites/data/datasources/favorites_local_data_source.dart'
    as _i654;
import '../../features/favorites/data/datasources/favorites_remote_data_source.dart'
    as _i567;
import '../../features/favorites/data/repositories/favorites_repository.dart'
    as _i485;
import '../../features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart'
    as _i218;
import '../../features/game_details_screen/data/datasources/game_details_remote_data_source.dart'
    as _i270;
import '../../features/game_details_screen/domain/repositories/game_details_repository.dart'
    as _i38;
import '../../features/game_details_screen/presentation/bloc/game_details_bloc/game_details_bloc.dart'
    as _i355;
import '../../features/genre_games/data/datasources/genre_games_remote_data_source.dart'
    as _i293;
import '../../features/genre_games/domain/repositories/genre_games_repository.dart'
    as _i518;
import '../../features/genre_games/presentation/bloc/genre_games_bloc/genre_games_bloc.dart'
    as _i205;
import '../../features/genres/data/datasources/genres_remote_data_source.dart'
    as _i223;
import '../../features/genres/domain/repositories/genres_repository.dart'
    as _i679;
import '../../features/genres/presentation/bloc/genres_bloc/genres_bloc.dart'
    as _i421;
import '../../features/search/data/datasources/search_remote_data_source.dart'
    as _i280;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i357;
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
    gh.lazySingleton<_i270.GameDetailsRemoteDataSource>(
      () => _i270.GameDetailsRemoteDataSource(),
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
    gh.lazySingleton<_i679.GenresRepository>(
      () => _i679.GenresRepository(
        genresRemoteDataSource: gh<_i223.GenresRemoteDataSource>(),
      ),
    );
    gh.factory<_i218.FavoritesBloc>(
      () => _i218.FavoritesBloc(repository: gh<_i485.FavoritesRepository>()),
    );
    gh.lazySingleton<_i518.GenreGamesRepository>(
      () => _i518.GenreGamesRepository(
        genreGamesRemoteDataSource: gh<_i293.GenreGamesRemoteDataSource>(),
      ),
    );
    gh.factory<_i421.GenresBloc>(
      () => _i421.GenresBloc(genresRepository: gh<_i679.GenresRepository>()),
    );
    gh.lazySingleton<_i357.SearchRepository>(
      () => _i357.SearchRepository(
        searchRemoteDataSource: gh<_i280.SearchRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i38.GameDetailsRepository>(
      () => _i38.GameDetailsRepository(
        gameDetailsRemoteDataSource: gh<_i270.GameDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i211.SearchBloc>(
      () => _i211.SearchBloc(searchRepository: gh<_i357.SearchRepository>()),
    );
    gh.factory<_i355.GameDetailsBloc>(
      () => _i355.GameDetailsBloc(
        gameDetailsRepository: gh<_i38.GameDetailsRepository>(),
      ),
    );
    gh.factory<_i205.GenreGamesBloc>(
      () => _i205.GenreGamesBloc(
        genreGamesRepository: gh<_i518.GenreGamesRepository>(),
      ),
    );
    return this;
  }
}
