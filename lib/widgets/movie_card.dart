import 'package:flutter/material.dart';
import 'package:movie_app/data/api_constants.dart';
import 'package:movie_app/data/movie_model.dart';
import 'package:movie_app/screens/details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(id: movie.id)));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 8, 20),
        width: 150,
        height: 220,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
