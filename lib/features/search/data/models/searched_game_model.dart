import 'package:equatable/equatable.dart';

class SearchedGameModel extends Equatable {
  final String name;
  final int popularity;
  final int gameId;
  final String url;

  SearchedGameModel({
    required this.name,
    required this.popularity,
    required this.gameId,
    required this.url,
  });

  factory SearchedGameModel.fromJson(
      Map<String, dynamic> json, int popularity) {
    return SearchedGameModel(
      name: json['name'] != null ? json['name'] as String : 'No data',
      popularity: popularity,
      gameId: json['id'] != null ? json['id'] as int : -1,
      url: json['background_image'] != null
          ? json['background_image'] as String
          : 'No data',
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
