import 'package:equatable/equatable.dart';

class GameGenreModel extends Equatable {
  final String name;
  final String url;
  final int id;
  final int gamesCount;

  GameGenreModel({
    required this.name,
    required this.url,
    required this.id,
    required this.gamesCount,
  });

  @override
  List<Object?> get props => [
        name,
        url,
        id,
        gamesCount,
      ];

  factory GameGenreModel.fromJson(Map<String, dynamic> json, String url) {
    return GameGenreModel(
      name: json['name'] as String,
      url: url,
      id: json['id'] as int,
      gamesCount: json['games_count'] as int,
    );
  }
}
