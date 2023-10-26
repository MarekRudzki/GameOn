import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  final String name;
  final String url;
  final int id;
  final int gamesCount;

  GenreModel({
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

  factory GenreModel.fromJson(Map<String, dynamic> json, String url) {
    return GenreModel(
      name: json['name'] as String,
      url: url,
      id: json['id'] as int,
      gamesCount: json['games_count'] as int,
    );
  }
}
