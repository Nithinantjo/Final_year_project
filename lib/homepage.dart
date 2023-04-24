import 'package:flutter/material.dart';
import 'package:shop/profile.dart';
import 'package:shop/screenhome.dart';
import 'package:shop/search.dart';

class HomePage extends StatefulWidget { 
  @override 
  State<HomePage> createState() => _HomePageState(); 
} 
 
class _HomePageState extends State<HomePage> { 
  int index = 0; 
  final screens = [ 
    const Home(),
    const Profile(),
    const Search()
  ]; 
 
  @override 
  Widget build(BuildContext context) => Scaffold( 
    body: screens[index],
        bottomNavigationBar: NavigationBarTheme( 
          data: NavigationBarThemeData( 
            indicatorColor: const Color.fromARGB(255, 220, 210, 180), 
            labelTextStyle: MaterialStateProperty.all( 
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), 
            ), 
          ), 
          child: NavigationBar( 
            height: 60, 
            backgroundColor: Colors.amber, 
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, 
            selectedIndex: index, 
            onDestinationSelected: (index) => 
                setState(() => this.index = index), 
            destinations: const [ 
              NavigationDestination( 
                icon: Icon(Icons.home_outlined), 
                selectedIcon: Icon(Icons.home), 
                label: 'Home', 
              ),
              NavigationDestination( 
                icon: Icon(Icons.person_outlined), 
                selectedIcon: Icon(Icons.person), 
                label: 'Profile  ', 
              ), 
              NavigationDestination( 
                icon: Icon(Icons.search_outlined), 
                selectedIcon: Icon(Icons.search), 
                label: 'Search ', 
              ), 
            ], 
          ), 
        ), 
      ); 
}

