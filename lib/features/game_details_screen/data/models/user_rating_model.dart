// Package imports:
import 'package:equatable/equatable.dart';

class UserRatingModel extends Equatable {
  final int? exceptional;
  final int? recommended;
  final int? meh;
  final int? skip;

  UserRatingModel({
    required this.exceptional,
    required this.recommended,
    required this.meh,
    required this.skip,
  });

  factory UserRatingModel.fromJsonList(List<Map<String, dynamic>> json) {
    final Map<String, int> ratings = {};

    for (final ratingValue in json) {
      final String title = ratingValue['title'] as String;
      final int count = ratingValue['count'] as int;
      final Map<String, int> rating = {title: count};
      ratings.addAll(rating);
    }
    return UserRatingModel(
      exceptional: ratings['exceptional'],
      recommended: ratings['recommended'],
      meh: ratings['meh'],
      skip: ratings['skip'],
    );
  }

  @override
  List<Object?> get props => [
        exceptional,
        recommended,
        meh,
        skip,
      ];
}
