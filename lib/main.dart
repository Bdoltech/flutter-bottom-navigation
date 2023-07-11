import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatefulWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  _NavigationAppState createState() => _NavigationAppState();
}

class _NavigationAppState extends State<NavigationApp> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    // Replace these placeholders with your actual page widgets
    PlaceholderWidget(text: 'Menu'),
    PlaceholderWidget(text: 'Favorites'),
    PlaceholderWidget(text: 'Search'),
    PlaceholderWidget(text: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black, // Set the background color to black
          centerTitle: true, // Center the title
          title: Text(
            'Google Nav Bar',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
        ),
          )
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: GNav(
              gap: 8,
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.all(15),
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundGradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 173, 0, 242),
                  Color.fromARGB(255, 132, 88, 208),
                  Colors.indigoAccent,
                ],
              ),
              tabs: const [
                GButton(
                  icon: Icons.format_align_right_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_outline_outlined,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.search_outlined,
                  text: 'Search',
                ),
                GButton(
                  icon: FontAwesomeIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  const PlaceholderWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}
