import 'package:flutter/material.dart';
import 'package:shop/profile.dart';
import 'package:shop/screenhome.dart';
import 'package:shop/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _selectedIndex = 0;
List _pages = [
  Home(),
  Profile(),
  Search()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: (newIndex){
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        ),
      );
  }
}