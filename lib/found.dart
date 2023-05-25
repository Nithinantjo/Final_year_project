import 'package:flutter/material.dart';

class Found extends StatelessWidget {
  String searched,price, count;
  Found({super.key, this.searched='search', required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _founditems(searched, price, count)
        
      ],
    );
  }
  Widget _founditems(String eachItem, String price, String count){
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
}