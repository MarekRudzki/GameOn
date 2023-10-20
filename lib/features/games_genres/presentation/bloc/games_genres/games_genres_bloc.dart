import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/games_genres/data/models/game_genre_model.dart';
import 'package:gameon/features/games_genres/domain/repositories/genres_repository.dart';

part 'games_genres_event.dart';
part 'games_genres_state.dart';

class GamesGenresBloc extends Bloc<GamesGenresEvent, GamesGenresState> {
  final GenresRepository _genresRepository;
  GamesGenresBloc({required GenresRepository genresRepository})
      : _genresRepository = genresRepository,
        super(GamesGenresInitial()) {
    on<GameGenreRequested>(_onGameGenreRequested);
  }

  Future<void> _onGameGenreRequested(
    GameGenreRequested event,
    Emitter<GamesGenresState> emit,
  ) async {
    final gameGenres = await _genresRepository.getGenres();
    emit(GamesGenresLoading());
    emit(GameGenreSuccess(gameGenreModels: gameGenres));
  }
}
