// Package imports:
import 'package:equatable/equatable.dart';

class SearchPageModel extends Equatable {
  final String searchQuery;
  final int page;

  SearchPageModel({
    required this.searchQuery,
    required this.page,
  });

  @override
  List<Object?> get props => [
        searchQuery,
        page,
      ];
}
