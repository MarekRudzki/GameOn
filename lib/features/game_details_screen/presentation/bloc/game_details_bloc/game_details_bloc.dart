import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/features/game_details_screen/data/models/game_details_model.dart';
import 'package:gameon/features/game_details_screen/domain/repositories/game_details_repository.dart';
import 'package:injectable/injectable.dart';

part 'game_details_event.dart';
part 'game_details_state.dart';

@injectable
class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final GameDetailsRepository _gameDetailsRepository;

  GameDetailsBloc({required GameDetailsRepository gameDetailsRepository})
      : _gameDetailsRepository = gameDetailsRepository,
        super(GameDetailsInitial()) {
    on<GameDetailsRequested>(_onGameDetailsRequested);
  }

  Future<void> _onGameDetailsRequested(
    GameDetailsRequested event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(GameDetailsLoading());
    final gameDetails =
        await _gameDetailsRepository.getGameDetails(gameId: event.gameId);
    emit(
      GameDetailsSuccess(gameDetails: gameDetails),
    );
  }
}
