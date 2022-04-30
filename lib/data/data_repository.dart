import 'dart:convert';

import 'package:movie_app/data/data_provider.dart';
import 'package:movie_app/data/movie_model.dart';

class MovieDataRepository {
  static Future<List<Movie>> getTrendingMovies() async {
    try {
      var response = await MovieDataProvider.getTrendingMovies();
      var data = jsonDecode(response.body);
      var resultArray = data["results"] as List<dynamic>;
      List<Movie> moviesList =
          resultArray.map((e) => Movie.fromJson(e)).toList();
      return moviesList;
    } catch (_) {
      throw Exception("Something went wrong");
    }
  }

  static Future<List<Movie>> getTopRatedMovies() async {
    try {
      var response = await MovieDataProvider.getTopRatedMovies();
      var data = jsonDecode(response.body);
      var resultArray = data["results"] as List<dynamic>;
      List<Movie> moviesList =
          resultArray.map((e) => Movie.fromJson(e)).toList();
      return moviesList;
    } catch (_) {
      throw Exception("Something went wrong");
    }
  }
}
