// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';
import 'package:gameon/features/game_details_screen/data/models/user_rating_model.dart';

class GameDetailsModel extends Equatable {
  final int popularity;
  final String url;
  final int id;
  final String description;
  final String developers;
  final int metacritic;
  final String name;
  final List<String> platforms;
  final int playtime;
  final double rating;
  final int reviewsCount;
  final UserRatingModel userRating;
  final String released;

  GameDetailsModel({
    required this.popularity,
    required this.url,
    required this.description,
    required this.developers,
    required this.id,
    required this.metacritic,
    required this.name,
    required this.platforms,
    required this.playtime,
    required this.rating,
    required this.reviewsCount,
    required this.userRating,
    required this.released,
  });

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) {
    final List<String> platformsList = [];
    final listDynamic = json['parent_platforms'] as List<dynamic>;
    final abc = listDynamic.map((e) => e as Map<String, dynamic>).toList();

    for (final platform in abc) {
      platformsList.add(platform['platform']['name'] as String);
    }

    return GameDetailsModel(
      popularity: json['added'] as int,
      url: json['background_image'] as String,
      description: json['description_raw'] as String,
      developers: (json['developers'] as List<dynamic>)[0]['name'] as String,
      metacritic: json['metacritic'] as int,
      name: json['name'] as String,
      platforms: platformsList,
      playtime: json['playtime'] as int,
      rating: json['rating'] as double,
      reviewsCount: json['reviews_count'] as int,
      userRating: UserRatingModel.fromJsonList(
        (json['ratings'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
      ),
      released: json['released'] as String,
      id: json['id'] as int,
    );
  }

  @override
  List<Object?> get props => [
        popularity,
        url,
        description,
        developers,
        id,
        metacritic,
        name,
        platforms,
        playtime,
        rating,
        reviewsCount,
        userRating,
        released,
      ];
}
