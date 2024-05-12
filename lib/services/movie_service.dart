// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_ratings/model/movie.dart';
import 'package:movie_ratings/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>?> getPopularMovies({int? pageNumber}) async {
    try {
      http.Response response = await _http.get('/movie/popular', query: {
        'pageNumber': pageNumber?.toString(),
      });
      if (response.statusCode == 200) {
        List<Movie> movies = (jsonDecode(response.body)['results'] as List)
            .map((data) => Movie.fromJson(data))
            .toList();
        print("movies-> ${movies}");
        return movies;
      } else {
        throw Exception('this Failed to load popular movies');
      }
    } catch (e) {
      throw Exception('that Failed to load popular movies: $e');
    }
  }

  Future<List<Movie>?> getUpcomingMovies({int? pageNumber}) async {
    try {
      http.Response response = await _http.get('/movie/upcoming', query: {
        'pageNumber': pageNumber?.toString(),
      });
      if (response.statusCode == 200) {
        List<Movie> movies = (jsonDecode(response.body)['results'] as List)
            .map((data) => Movie.fromJson(data))
            .toList();
        return movies;
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      throw Exception('Failed to load upcoming movies: $e');
    }
  }

  Future<List<Movie>?> searchMovies(String? searchTerm,
      {int? pageNumber}) async {
    try {
      http.Response response = await _http.get('/search/movie', query: {
        'query': searchTerm,
        'pageNumber': pageNumber?.toString(),
      });
      if (response.statusCode == 200) {
        List<Movie> movies = (jsonDecode(response.body)['results'] as List)
            .map((data) => Movie.fromJson(data))
            .toList();
        return movies;
      } else {
        throw Exception('Failed to search movies');
      }
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }
}
