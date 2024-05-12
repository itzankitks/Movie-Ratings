// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:movie_ratings/model/main_page_data.dart';
import 'package:movie_ratings/model/movie.dart';
import 'package:movie_ratings/model/search_category.dart';
import 'package:movie_ratings/services/movie_service.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie>? _movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          print("i am popular");
          _movies = await _movieService.getPopularMovies(
              pageNumber: state.pageNumber);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          print("i am upcoming");
          _movies = await _movieService.getUpcomingMovies(
              pageNumber: state.pageNumber);
        } else if (state.searchCategory == SearchCategory.none) {
          print("i am none");
          _movies = [];
        }
      } else {
        print("i am searched text");
        _movies = await _movieService.searchMovies(state.searchText);
      }

      state = state.copyWith(
          movies: [...state.movies, ..._movies!],
          pageNumber: state.pageNumber + 1);
    } catch (e) {
      print("error is: $e");
    }
  }

  void updateSearchCategory(String _category) {
    try {
      state = state.copyWith(
        movies: [],
        pageNumber: 1,
        searchCategory: _category,
        searchText: '',
      );
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateTextSearch(String _searchText) {
    try {
      state = state.copyWith(
          movies: [],
          pageNumber: 1,
          searchCategory: SearchCategory.none,
          searchText: _searchText);
      getMovies();
    } catch (e) {
      print(e);
    }
  }
}
