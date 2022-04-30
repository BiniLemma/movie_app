import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/data_repository.dart';
import 'package:movie_app/data/movie_model.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> movies = [];
  List<Movie> topRatedMovies = [];

  List<Movie> get getMovies => [...movies];
  List<Movie> get getTopRatedMovies => [...topRatedMovies];

  getAndSetMovies() async {
    List<Movie> resMovies = await MovieDataRepository.getTrendingMovies();
    movies = resMovies;
    notifyListeners();
  }

  getAndSetTopRatedMovies() async {
    List<Movie> resMovies = await MovieDataRepository.getTopRatedMovies();
    topRatedMovies = resMovies;
    notifyListeners();
  }
}
