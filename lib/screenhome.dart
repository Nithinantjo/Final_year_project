import 'package:flutter/material.dart';
import 'package:shop/cards.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
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
                children: <Widget>[
                  Cards(name: 'Burger',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: false,
                      isFavorite: false,count: 0,context: context),
                  Cards(name: 'Rice',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: false,
                      isFavorite: false,count: 0,context: context),
                  Cards(name: 'Sugar',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: false,
                      isFavorite: false,count: 0,context: context),
                  Cards(name: 'Cookie',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: false,
                      isFavorite: false,count: 0,context: context),
                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }
}
