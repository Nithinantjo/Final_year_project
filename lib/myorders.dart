import 'package:flutter/material.dart';
import 'package:shop/found.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFFCFAF8),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const Text('My Orders',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30.0),
            Found()
           ]
        ),
      ),
      
    );
  }
  
}