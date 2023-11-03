// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';
import 'package:gameon/features/game_details_screen/data/models/user_rating_model.dart';

class GameDetailsModel extends Equatable {
  final String description;
  final String developers;
  final String esrbRating;
  final int metacritic;
  final List<String> platforms;
  final int playtime;
  final String released;
  final int reviewsCount;
  final List<String> screenshots;
  final UserRatingModel userRating;

  GameDetailsModel({
    required this.description,
    required this.developers,
    required this.esrbRating,
    required this.metacritic,
    required this.platforms,
    required this.playtime,
    required this.released,
    required this.reviewsCount,
    required this.screenshots,
    required this.userRating,
  });

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) {
    final List<String> platformsList = [];
    final listDynamic = json['parent_platforms'] as List<dynamic>;
    final platforms =
        listDynamic.map((e) => e as Map<String, dynamic>).toList();

    for (final platform in platforms) {
      platformsList.add(platform['platform']['name'] as String);
    }

    final List<String> screenshotsList = [];
    final screenshotListDynamic = json['results'] as List<dynamic>;
    final screenshots =
        screenshotListDynamic.map((e) => e as Map<String, dynamic>).toList();

    for (final screenshot in screenshots) {
      screenshotsList.add(screenshot['image'] as String);
    }

    return GameDetailsModel(
      description: json['description_raw'] != ''
          ? json['description_raw'] as String
          : 'No game description available',
      developers: json['developers'] != null
          ? (json['developers'] as List<dynamic>)[0]['name'] as String
          : 'No Data',
      esrbRating: json['esrb_rating'] != null
          ? json['esrb_rating']['name'] as String
          : 'No Data',
      metacritic: json['metacritic'] != null ? json['metacritic'] as int : 0,
      platforms: json['parent_platforms'] != null ? platformsList : ['No Data'],
      playtime: json['playtime'] != null ? json['playtime'] as int : 0,
      released:
          json['released'] != null ? json['released'] as String : 'No Data',
      reviewsCount:
          json['reviews_count'] != null ? json['reviews_count'] as int : 0,
      screenshots: json['results'] != null ? screenshotsList : ['No Data'],
      userRating: json['ratings'] != null
          ? UserRatingModel.fromJsonList(
              (json['ratings'] as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList(),
            )
          : UserRatingModel(exceptional: 0, recommended: 0, meh: 0, skip: 0),
    );
  }

  @override
  List<Object?> get props => [
        description,
        developers,
        esrbRating,
        metacritic,
        platforms,
        playtime,
        released,
        reviewsCount,
        screenshots,
        userRating,
      ];
}
