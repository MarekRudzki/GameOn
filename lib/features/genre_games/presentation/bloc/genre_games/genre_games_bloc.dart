import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/genre_games/data/models/genre_game_model.dart';
import 'package:gameon/features/genre_games/domain/repositories/genre_games_repository.dart';

part 'genre_games_event.dart';
part 'genre_games_state.dart';

class GenreGamesBloc extends Bloc<GenreGamesEvent, GenreGamesState> {
  final GenreGamesRepository _genreGamesRepository;
  GenreGamesBloc({required GenreGamesRepository genreGamesRepository})
      : _genreGamesRepository = genreGamesRepository,
        super(GenreGamesInitial()) {
    on<GenreGamesRequested>(_onGenreGamesRequested);
  }

  Future<void> _onGenreGamesRequested(
    GenreGamesRequested event,
    Emitter<GenreGamesState> emit,
  ) async {
    emit(GenreGamesLoading());
    final genreGames = await _genreGamesRepository.getGameModels(event.genreId);
    emit(GenreGamesSuccess(genreGames: genreGames));
  }
}
