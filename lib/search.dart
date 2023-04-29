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
              fillColor: const Color.fromARGB(255, 148, 146, 146),
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: const Icon(Icons.search, color: Colors.black,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black
              ),
              hintText: "Search items"
            ),
          ),
        ),
      ),
      body: Found(searched: search,price: '100',count: '15',),
      );
  }
}