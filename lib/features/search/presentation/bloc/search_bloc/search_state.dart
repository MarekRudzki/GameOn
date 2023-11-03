part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<SearchedGameModel>? searchedGames;
  final dynamic error;
  final int? page;

  SearchState({
    this.searchedGames,
    this.error,
    this.page = 1,
  });

  @override
  List<Object?> get props => [
        searchedGames,
        error,
        page,
      ];
}
