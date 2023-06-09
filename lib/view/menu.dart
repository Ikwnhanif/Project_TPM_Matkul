import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_github/view/login_page.dart';
import 'package:project_github/view/profile.dart';
import 'package:project_github/view/repo_search_view.dart';
import 'package:project_github/view/user_search_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ProfilePage(),
    RepoSearch(),
    UserSearch(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Search Repositories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search User',
          ),
        ],
      ),
    );
  }
}
