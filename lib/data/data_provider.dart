import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/api_constants.dart';

class MovieDataProvider {
  static Future<http.Response> getTrendingMovies() async {
    var url =
        "${ApiConstants.BASE_URL}/trending/movie/day?api_key=${ApiConstants.API_KEY}";
    return await http.get(Uri.parse(url));
  }

  static Future<http.Response> getTopRatedMovies() async {
    var url =
        "${ApiConstants.BASE_URL}/movie/top_rated?api_key=${ApiConstants.API_KEY}";
    return await http.get(Uri.parse(url));
  }

  static Future<Map<String, dynamic>> getMovieDetail(int id) async {
    try {
      var url =
          "${ApiConstants.BASE_URL}/movie/$id?api_key=${ApiConstants.API_KEY}";
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) return jsonDecode(res.body);
      throw Exception("");
    } catch (e) {
      throw Exception("");
    }
  }
}
