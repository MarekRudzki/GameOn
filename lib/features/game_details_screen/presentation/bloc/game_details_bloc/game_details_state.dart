part of 'game_details_bloc.dart';

class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object> get props => [];
}

class GameDetailsInitial extends GameDetailsState {}

class GameDetailsSuccess extends GameDetailsState {
  final GameDetailsModel gameDetails;

  GameDetailsSuccess({
    required this.gameDetails,
  });

  @override
  List<Object> get props => [gameDetails];
}

class GameDetailsLoading extends GameDetailsState {}
