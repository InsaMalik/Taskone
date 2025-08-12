import 'package:flutter/material.dart';
import 'package:google_signin/PostPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; 

  final List<Widget> _pages = [
    Center(child: Text("Welcome to Home", style: TextStyle(fontSize: 20))),
    PostsPage(), 
    Center(child: Text("Coming Soon", style: TextStyle(fontSize: 20))),
    Center(child: Text("Page 4", style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Posts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            label: "Coming Soon",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Page 4",
          ),
        ],
      ),
    );
  }
}
