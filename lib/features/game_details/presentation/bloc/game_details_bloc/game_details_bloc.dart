// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:gameon/features/game_details/data/models/game_details_model.dart';
import 'package:gameon/features/game_details/data/repositories/game_details_repository.dart';

part 'game_details_event.dart';
part 'game_details_state.dart';

@injectable
class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final GameDetailsRepository _repository;

  GameDetailsBloc({required GameDetailsRepository repository})
      : _repository = repository,
        super(const GameDetailsInitial()) {
    on<GameDetailsRequested>(_onGameDetailsRequested);
  }

  Future<void> _onGameDetailsRequested(
    GameDetailsRequested event,
    Emitter<GameDetailsState> emit,
  ) async {
    try {
      emit(const GameDetailsLoading());
      final gameDetails = await _repository.getGameDetails(gameId: event.gameId);
      emit(GameDetailsSuccess(gameDetails: gameDetails));
    } catch (e) {
      emit(GameDetailsError(message: 'Failed to load game details: $e'));
    }
  }
}
