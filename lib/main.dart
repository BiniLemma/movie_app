/*Authors: Binyam Lemma - ATR/1341/10
           Maria G/Medhin - ATR/1627/11
           Kansa Tahir - ATR/3185/11
           Dagim Tesfaye - ATR/3361/08 */

import 'package:flutter/material.dart';
import 'package:movie_app/data/provider.dart';
import 'package:movie_app/tab.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Mazzard'),
        home: const TabScreen(),
      ),
    );
  }
}
