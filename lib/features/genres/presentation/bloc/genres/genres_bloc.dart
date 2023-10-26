import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/genres/data/models/genre_model.dart';
import 'package:gameon/features/genres/domain/repositories/genres_repository.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository _genresRepository;
  GenresBloc({required GenresRepository genresRepository})
      : _genresRepository = genresRepository,
        super(GenresInitial()) {
    on<GenresRequested>(_onGameGenreRequested);
  }

  Future<void> _onGameGenreRequested(
    GenresRequested event,
    Emitter<GenresState> emit,
  ) async {
    emit(GenresLoading());
    final gameGenres = await _genresRepository.getGenres();
    emit(GenresSuccess(gameGenreModels: gameGenres));
  }
}
