// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/genres/data/models/genre_model.dart';
import 'package:gameon/features/genres/data/repositories/genres_repository.dart';

part 'genres_event.dart';
part 'genres_state.dart';

@injectable
class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresRepository _repository;

  GenresBloc({required GenresRepository repository})
      : _repository = repository,
        super(const GenresInitial()) {
    on<GenresRequested>(_onGenresRequested);
  }

  Future<void> _onGenresRequested(
    GenresRequested event,
    Emitter<GenresState> emit,
  ) async {
    try {
      emit(const GenresLoading());
      final gameGenres = await _repository.getGenres();
      emit(GenresSuccess(gameGenreModels: gameGenres));
    } catch (e) {
      emit(GenresError(message: 'Failed to load genres: $e'));
    }
  }
}
