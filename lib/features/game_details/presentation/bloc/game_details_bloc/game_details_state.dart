part of 'game_details_bloc.dart';

sealed class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object> get props => [];
}

final class GameDetailsInitial extends GameDetailsState {
  const GameDetailsInitial();
}

final class GameDetailsLoading extends GameDetailsState {
  const GameDetailsLoading();
}

final class GameDetailsSuccess extends GameDetailsState {
  final GameDetailsModel gameDetails;

  const GameDetailsSuccess({required this.gameDetails});

  @override
  List<Object> get props => [gameDetails];
}

final class GameDetailsError extends GameDetailsState {
  final String message;

  const GameDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
