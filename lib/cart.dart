import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/cards.dart';
import 'package:shop/myorders.dart';
import 'package:shop/services/api.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartItems= [];
  bool isLoading = true;
  @override
  void initState() {
    isLoading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (isLoading) {
      cartItems = await fetchData();
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }

  fetchData() async {
    List cart_items = [];
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString('email');
    if (email == null) return cart_items;
    cart_items = await APIService.showCart(email);
    return cart_items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 225, 223),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(children: [
              const Text('CART',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 15.0),
              const SizedBox(height: 15.0),
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
                    children: cartItems.map((item){
                      return Cards(name: item['product']['name'],price: item['product']['price'].toString(),imgpath: item['product']['image'],added: true,
                      isFavorite: false, count: item['count'],context: context);
                    }).toList(),
                  )),
            ]),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          place(context);
        },
        child: Text('Place Order'),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty(Color(0xFFEF7532)),
        //   elevation: MaterialStateProperty.all(20),

        // ),
      ),
    );
  }

  void place(BuildContext ctx) async{
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString("email");
    if(email!=null){
      await APIService.placeOrder(email);
    }
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx)=>MyOrder()));
  }
}
