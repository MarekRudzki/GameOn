// Package imports:
import 'package:equatable/equatable.dart';

class FavoriteGameModel extends Equatable {
  final String name;
  final int popularity;
  final int gameId;
  final String url;

  const FavoriteGameModel({
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'popularity': popularity,
      'id': gameId,
      'url': url,
    };
  }

  FavoriteGameModel copyWith({
    String? name,
    int? popularity,
    int? gameId,
    String? url,
  }) {
    return FavoriteGameModel(
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      gameId: gameId ?? this.gameId,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, popularity, gameId, url];
}
