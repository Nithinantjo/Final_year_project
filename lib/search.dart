import 'package:flutter/material.dart';
import 'package:shop/found.dart';

class Search
 extends StatefulWidget {
  const Search
  ({super.key});

  @override
  State<Search> createState() => _SearchState();
}

String search='Searched';

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFCFAF8),
        title: Container(
          height: 45,
          child: TextField(
            onChanged: (value){
              setState(() {
                search=value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 148, 146, 146),
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.black,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
              hintText: "Search items"
            ),
          ),
        ),
      ),
      body: Found(searched: search,),
      );
  }
}