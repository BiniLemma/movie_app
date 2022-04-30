import 'package:flutter/material.dart';
import 'package:movie_app/data/api_constants.dart';
import 'package:movie_app/data/provider.dart';
import 'package:movie_app/widgets/carousel.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "MOVIES APP",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: context.read<MovieProvider>().getAndSetMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 300,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.black)),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                }
                return Consumer<MovieProvider>(
                  builder: (context, movieProvider, child) {
                    return Carousel(movies: movieProvider.getMovies);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Top Rated",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            FutureBuilder(
              future: context.read<MovieProvider>().getAndSetTopRatedMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 230,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.black)),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                }
                return Consumer<MovieProvider>(
                  builder: (context, movieProvider, child) {
                    return TopRated(movies: movieProvider.getTopRatedMovies);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
