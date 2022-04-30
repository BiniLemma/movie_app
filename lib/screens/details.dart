import 'package:flutter/material.dart';
import 'package:movie_app/data/api_constants.dart';
import 'package:movie_app/data/data_provider.dart';

class Details extends StatelessWidget {
  final int id;
  const Details({this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
          future: MovieDataProvider.getMovieDetail(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.black));
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            }
            var movie = snapshot.data as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const SizedBox(height: 335),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            "${ApiConstants.BASE_IMAGE_URL}${movie["poster_path"]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: media.width * .8,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 1),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildItem(Icons.star, Colors.amber, "Ratings",
                                  "${movie["vote_average"] ?? 0}/10"),
                              buildItem(Icons.person_outline, Colors.black,
                                  "Vote count", "${movie["vote_count"] ?? 0}"),
                              buildItem(Icons.timer_outlined, Colors.black,
                                  "Runtime", "${movie["runtime"] ?? 0} min")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie["original_title"],
                          style: TextStyle(
                            fontFamily: "Mazzard",
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          movie["tagline"],
                          style: TextStyle(
                            fontFamily: "Mazzard",
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              movie["release_date"],
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              movie["adult"] ? "PG-18" : "PG-13",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              movie["original_language"],
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...(movie["genres"] as List<dynamic>)
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: .5, color: Colors.grey),
                                      ),
                                      child: Center(child: Text(e["name"])),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Plot Summary",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        const SizedBox(height: 5),
                        Text(movie["overview"],
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 10),
                        const Text("Production Companies",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...(movie["production_companies"]
                                      as List<dynamic>)
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: .5, color: Colors.grey),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                                "${ApiConstants.BASE_IMAGE_URL}${e['logo_path']}"),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(e["name"])
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Column buildItem(IconData icon, Color color, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 3),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 3),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
