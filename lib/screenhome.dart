import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/cards.dart';
import 'package:shop/services/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? email;
  List prodItems= [];
  bool isLoading = true;
  @override
  void initState() {
    isLoading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');
    if (isLoading) {
      prodItems = await fetchData();
      prodItems.shuffle();
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }

  fetchData() async {
    List prod_items = [];
    prod_items = await APIService.all();
    return prod_items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body:isLoading? const Center(child: CircularProgressIndicator(),) :  ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          const Text('HOME',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 30.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children:prodItems.map((item){
                      return Cards(name: item['name'],price: item['price'].toString(),imgpath: item['image'],added: check(item['carted']),
                      isFavorite: false, count: coun(item['carted']),context: context);
                    }).toList(),
              )),
          const SizedBox(height: 150.0)
        ],
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
