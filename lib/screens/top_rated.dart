import 'package:flutter/material.dart';
import 'package:movie_app/data/provider.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class TopRated extends StatelessWidget {
  const TopRated({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "TOP RATED",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          var movies = movieProvider.getTopRatedMovies;
          return SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(movie: movies[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
