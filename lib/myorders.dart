import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/found.dart';
import 'package:shop/services/api.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
   List orderItems= [];
  bool isLoading = true;
  @override
  void initState() {
    isLoading = true;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (isLoading) {
      orderItems = await fetchData();
      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }

  fetchData() async {
    List order_items = [];
    final sharedPrefs = await SharedPreferences.getInstance();
    String? email = sharedPrefs.getString('email');
    if (email == null) return order_items;
    order_items = await APIService.myOrders(email);
    return order_items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFFFCFAF8),
      body: SafeArea(
        child:isLoading? const CircularProgressIndicator()
          : ListView(
          shrinkWrap: true,
          children: [
            const Text('My Orders',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30.0)
           ]+orderItems.map((item){
                      return Found(searched: item['product']['name'],price: item['product']['price'].toString(), count: item['count'], added: false, imgpath: item['product']['image'],);
                    }).toList(),
        ),
      ),
      
    );
  }
}