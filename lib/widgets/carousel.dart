import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/api_constants.dart';
import 'package:movie_app/data/movie_model.dart';
import 'package:movie_app/screens/details.dart';

class Carousel extends StatelessWidget {
  final List<Movie> movies;
  const Carousel({
    this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var moviesList = movies
        .map((movie) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(id: movie.id)));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1), //color of shadow
                      spreadRadius: 2, //spread radius
                      blurRadius: 7, // blur radius
                      offset: const Offset(0, 3), // changes position of shadow
                    )
                  ],
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    return CarouselSlider(
      items: moviesList,
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        reverse: false,
        height: media.height * .5,
        // viewportFraction: .8,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        pauseAutoPlayOnManualNavigate: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
