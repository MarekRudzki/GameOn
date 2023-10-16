import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'games_genres_event.dart';
part 'games_genres_state.dart';

class GamesGenresBloc extends Bloc<GamesGenresEvent, GamesGenresState> {
  GamesGenresBloc() : super(GamesGenresInitial()) {
    on<GameGenreChanged>(_onGameGenreChanged);
  }

  void _onGameGenreChanged(
    GameGenreChanged event,
    Emitter<GamesGenresState> emit,
  ) {
    emit(GenreChangeSuccess(genre: event.genre));
  }
}
