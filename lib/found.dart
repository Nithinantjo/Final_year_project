import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'details.dart';

class Found extends StatefulWidget {
  String searched,price, imgpath;
  int count;
  bool added;
  Found({super.key,required this.searched, required this.price, required this.count, required this.added, required this.imgpath});

  @override
  State<Found> createState() => _FoundState();
}

class _FoundState extends State<Found> {
  String? email;
  @override
  Widget build(BuildContext context) {
      @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    
    final sharedPrefs = await SharedPreferences.getInstance();
    email = sharedPrefs.getString('email');
  }
  String Name = "";
    if(widget.searched.length<12){
      Name = widget.searched;
    }
    else{
      Name = widget.searched.substring(0,8) + "...";
    }

    return Column(
      children: [
        _founditems(Name, widget.price, 'count')
        
      ],
    );
  }

  Widget _founditems(String eachItem, String price, String count){
    return Card(
      elevation: 20,
      child: TextButton(
        onPressed: (){
Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detail(
                          assetPath: widget.imgpath,
                          price: widget.price,
                          name: widget.searched,
                          count: widget.count,
                          isadded: widget.added,
                        )));
        },
        child: Row(children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset('images/icon.jpg'),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eachItem,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              Text('Price: $price',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),),
              Text('Count: $count',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),)
            ],
          )
        ]),
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