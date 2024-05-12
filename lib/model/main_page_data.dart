import 'package:movie_ratings/model/movie.dart';
import 'package:movie_ratings/model/search_category.dart';

class MainPageData {
  MainPageData(
      {required this.movies,
      required this.pageNumber,
      required this.searchCategory,
      required this.searchText});

  final List<Movie> movies;
  final int pageNumber;
  final String searchCategory;
  final String searchText;

  MainPageData.initial()
      : movies = [],
        pageNumber = 1,
        searchCategory = SearchCategory.popular,
        searchText = '';

  MainPageData copyWith(
      {List<Movie>? movies,
      int? pageNumber,
      String? searchCategory,
      String? searchText}) {
    // print('----> ${MainPageData}');
    return MainPageData(
        movies: movies ?? this.movies,
        pageNumber: pageNumber ?? this.pageNumber,
        searchCategory: searchCategory ?? this.searchCategory,
        searchText: searchText ?? this.searchText);
  }
}
