import 'package:equatable/equatable.dart';

class GenreGameModel extends Equatable {
  final String name;
  final int popularity;
  final int gameId;
  final String url;

  GenreGameModel({
    required this.name,
    required this.popularity,
    required this.gameId,
    required this.url,
  });

  factory GenreGameModel.fromJson(Map<String, dynamic> json, int popularity) {
    return GenreGameModel(
      name: json['name'] as String,
      popularity: popularity,
      gameId: json['id'] as int,
      url: json['background_image'] as String,
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
