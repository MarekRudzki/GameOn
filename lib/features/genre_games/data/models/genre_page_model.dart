import 'package:equatable/equatable.dart';

class GenrePageModel extends Equatable {
  final int page;
  final int id;

  GenrePageModel({
    required this.page,
    required this.id,
  });

  @override
  List<Object?> get props => [
        page,
        id,
      ];
}
