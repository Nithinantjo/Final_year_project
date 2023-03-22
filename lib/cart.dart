import 'package:flutter/material.dart';
import 'package:shop/cards.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          Text('CART',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          
          SizedBox(height: 15.0),
          Container(
                padding: EdgeInsets.only(right: 15.0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: MediaQuery.of(context).size.height - 50.0,
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    Cards(name: 'Burger',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: true,
                      isFavorite: false,context: context),
                  Cards(name: 'Rice',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: true,
                      isFavorite: false,context: context),
                  Cards(name: 'Sugar',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: true,
                      isFavorite: false,context: context),
                  Cards(name: 'Cookie',price: 'Rs. 3.99',imgpath: 'images/icon.jpg',added: true,
                      isFavorite: false,context: context),
                        
                  ],
                )),]
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: (){},
        child: Text('Place Order'),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty(Color(0xFFEF7532)),
        //   elevation: MaterialStateProperty.all(20),

        // ),
        ),
    );
  }
  
}