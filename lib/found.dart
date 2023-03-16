import 'package:flutter/material.dart';

class Found extends StatelessWidget {
  String searched;
  Found({super.key, this.searched='search'});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _founditems(searched)
        
      ],
    );
  }
  Widget _founditems(String eachItem){
    return Card(
      elevation: 20,
      child: TextButton(
        onPressed: (){},
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
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
              Text('Price: Rs 100',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),)
            ],
          )
        ]),
      ),
    );
  }
}