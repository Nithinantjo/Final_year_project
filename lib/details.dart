
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/services/api.dart';

class Detail extends StatefulWidget {
  final assetPath, price, name;
  int count;

  Detail({this.assetPath, this.price, this.name, required this.count});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool _added=false;

  int _amount=0;
   @override
  void initState(){
    _amount= widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: ListView(
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
            )
        ]
      ));
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