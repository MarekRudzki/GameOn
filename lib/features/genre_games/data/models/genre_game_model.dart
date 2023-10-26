import 'package:equatable/equatable.dart';

class GenreGameModel extends Equatable {
  final String name;
  final double rating;
  final String url;

  GenreGameModel({
    required this.name,
    required this.rating,
    required this.url,
  });

  factory GenreGameModel.fromJson(Map<String, dynamic> json) {
    return GenreGameModel(
      name: json['name'] as String,
      rating: json['rating'] as double,
      url: json['background_image'] as String,
    );
  }

  @override
  List<Object?> get props => [
        name,
        rating,
        url,
      ];
}
