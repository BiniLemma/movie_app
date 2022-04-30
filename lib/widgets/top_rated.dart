import 'package:flutter/material.dart';
import 'package:movie_app/data/movie_model.dart';
import 'package:movie_app/widgets/movie_card.dart';

class TopRated extends StatelessWidget {
  final List<Movie> movies;
  const TopRated({
    this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}
