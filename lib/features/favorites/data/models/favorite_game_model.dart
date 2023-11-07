import 'package:equatable/equatable.dart';

class FavoriteGameModel extends Equatable {
  final String name;
  final int popularity;
  final int gameId;
  final String url;

  FavoriteGameModel({
    required this.name,
    required this.popularity,
    required this.gameId,
    required this.url,
  });

  factory FavoriteGameModel.fromJson(Map<String, dynamic> json) {
    return FavoriteGameModel(
      name: json['name'] as String,
      popularity: json['popularity'] as int,
      gameId: json['id'] as int,
      url: json['url'] as String,
    );
  }

  @override
  List<Object?> get props => [
        name,
        popularity,
        gameId,
        url,
      ];
}
