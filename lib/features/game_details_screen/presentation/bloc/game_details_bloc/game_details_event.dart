part of 'game_details_bloc.dart';

class GameDetailsEvent extends Equatable {
  const GameDetailsEvent();

  @override
  List<Object> get props => [];
}

class GameDetailsRequested extends GameDetailsEvent {
  final int gameId;

  GameDetailsRequested({
    required this.gameId,
  });

  @override
  List<Object> get props => [gameId];
}
