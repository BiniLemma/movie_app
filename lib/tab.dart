import 'package:flutter/material.dart';

import 'package:movie_app/screens/home.dart';
import 'package:movie_app/screens/top_rated.dart';

class TabScreen extends StatefulWidget {
  static String routeName = "/tab";

  const TabScreen({Key key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [const Home(), const TopRated()];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          currentIndex: _selectedPageIndex,
          selectedIconTheme: const IconThemeData(size: 30),
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: "Top Rated",
              icon: Icon(Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
