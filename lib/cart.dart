import 'package:flutter/material.dart';
import 'package:shop/details.dart';

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
                    _buildCard('Cookie mint', '\$3.99', 'images/icon.jpg',
                        false, false, context),
                    _buildCard('Cookie cream', '\$5.99', 'images/icon.jpg',
                        true, false, context),
                    _buildCard('Cookie classic', '\$1.99',
                        'images/icon.jpg', false, true, context),
                    _buildCard('Cookie choco', '\$2.99', 'images/icon.jpg',
                        false, false, context),
                        
                  ],
                )),]
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: (){},
        child: Text('Place Order')),
    );
  }
  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Detail(
                    assetPath: imgPath,
                    cookieprice: price,
                    cookiename: name,
                  )));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: name,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 15.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 16.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 16.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 18.0),
                              TextButton(
                                onPressed: (){},
                                child: Text('Add to cart',
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        color: Color(0xFFD17E50),
                                        fontSize: 18.0)),
                              )
                            ],
                            if (added) ...[
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.remove_circle_outline,
                                    color: Color(0xFFD17E50), size: 20.0),
                              ),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0)),
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.add_circle_outline,
                                    color: Color(0xFFD17E50), size: 20.0),
                              ),
                            ]
                          ]))
                ]))));
}
}