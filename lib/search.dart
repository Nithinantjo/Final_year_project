import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/found.dart';
import 'package:shop/services/api.dart';

class Search
 extends StatefulWidget {
  const Search
  ({super.key});

  @override
  State<Search> createState() => _SearchState();
}

String search='Searched';

class _SearchState extends State<Search> {
  bool sear = true;
  List prods = [];
  String? email;
  @override
  Widget build(BuildContext context) {
     @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');}
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFCFAF8),
        title: Container(
          height: 45,
          child: TextField(
            onSubmitted: (value) async{
              prods = await APIService.search(value);
              setState(() {
                sear = false;
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
      body:sear?const Center(child: Text("Search Here"),) : ListView(children: 
        prods.map((item){
          return Found(searched: item["name"], price: item["price"], count: coun(item['carted']), added: check(item['carted']), 
          imgpath: item['image']);
        }).toList(),
        ),
      );
  }
     check(List carted) {
    for(int i=0; i<carted.length; i++){
      if(carted[i]["email"]==email){
        return true;
      }
    }
    return false;
  }
    coun(List carted){
        for(int i=0; i<carted.length; i++){
      if(carted[i]["email"]==email){
        return carted[i]["count"];
      }
  }
  return 1;
  }
}