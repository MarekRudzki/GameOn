part of 'search_bloc.dart';

final class SearchState extends Equatable {
  final List<SearchedGameModel>? searchedGames;
  final Object? error;
  final int? page;

  const SearchState({
    this.searchedGames,
    this.error,
    this.page = 1,
  });

  @override
  List<Object?> get props => [searchedGames, error, page];
}
