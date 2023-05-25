
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/services/api.dart';

import 'cards.dart';

class Detail extends StatefulWidget {
  final assetPath, price, name;
  int count;

  Detail({this.assetPath, this.price, this.name, required this.count});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  
  List reccItems= [];
  List reccDetails = [];
  bool isLoading = true;
  bool _added=false;
  String? email= "";

  int _amount=0;
   @override
  void initState(){
    isLoading = true;
    _amount= widget.count;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    
    final sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');
    if (isLoading) {
      reccItems = await fetchData();
      for(int i=0; i<reccItems.length; i++){
        var item = await APIService.eachProd(reccItems[i]);
        reccDetails.add(item);
      }
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }

  fetchData() async {
    List recc_items = [];
    recc_items = await APIService.recommend("Oranges");
    return recc_items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body:isLoading? const Center(child: CircularProgressIndicator(),): ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(height: 15.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Cookie',
              style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
            ),
          ),
          const  SizedBox(height: 15.0),
            Hero(
              tag: widget.assetPath,
              child: Image.asset(widget.assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain
              )
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(widget.price,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(widget.name,
                  style: const TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0)),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: const Text('Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: !_added?(TextButton(
                onPressed: (){
                  setState(() {
                    _added=true;
                  });
                  add();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFFF17532)
                  ),
                  child: const Center(
                    child: Text('Add to cart',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                  ),
                    )
                  )
                ),
              )):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      if(_amount>1)
                      {_amount--;}
                      else
                      {_added=false;}
                    });
                    decre();
                  },
                  child: const CircleAvatar(backgroundColor: Color(0xFFF17532),
                  radius: 25,
                  child: Icon(Icons.remove,
                  size: 30,),)),
                  Text('$_amount',
                  style: const TextStyle(
                                            fontFamily: 'Varela',
                                            color: Color(0xFFD17E50),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0)),
                  TextButton(onPressed: (){
                    setState(() {
                      _amount++;
                    });
                    incre();
                  },
                  child: const CircleAvatar(backgroundColor: Color(0xFFF17532),
                  radius: 25,
                  child: Icon(Icons.add,
                  size: 30,),))
                ],
              )
            ),
            GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: reccDetails.map((item){
                      return Cards(name: item['name'],price: item['price'].toString(),imgpath: 'images/icon.jpg',added: check(item['carted']),
                      isFavorite: false, count: coun(item['carted']),context: context);
                    }).toList(),)
        ]
      ));
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
  return 0;
  }

    void incre() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString("email");
    if(email!=null){
      APIService.increment(email, widget.name);
    }
  }

  void decre() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString("email");
    if(email!=null){
      APIService.decrement(email, widget.name);
    }
  }

  void add() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString("email");
    if(email!=null){
      APIService.addCart(email, widget.name);
    }
  }
}