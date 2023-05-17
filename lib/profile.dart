import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/login.dart';
import 'package:shop/cart.dart';
import 'package:shop/main.dart';
import 'package:shop/myorders.dart';


class Profile
 extends StatelessWidget {
  const Profile
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 240, 240)
      ),
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 12.0,
                          blurRadius: 5.0)
                    ],
                color: Color.fromARGB(255, 36, 150, 168),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                )
              ),
              
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Name',
                            style: TextStyle(
                              color: Color.fromARGB(255, 75, 73, 73),
                              fontSize: 15
                            ),),
                            Text('Emai ID',
                            style: TextStyle(
                              color: Color.fromARGB(255, 75, 73, 73),
                              fontSize: 15
                            )),
                            Text('Reference ID',
                            style: TextStyle(
                              color: Color.fromARGB(255, 75, 73, 73),
                              fontSize: 15
                            ))
                          ],
                        ),
                      
                    ],
                    
                              ),
                ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(179, 195, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    onPressed: (){Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>MyOrder())
                    );},
                      child: Row(
                        children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('My Orders',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            ),
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
             Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(179, 195, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    onPressed: (){Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>Cart())
                    );},
                      child: Row(
                        children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Cart',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            ),
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(179, 195, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    onPressed: (){},
                      child: Row(
                        children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Settings',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            ),
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(179, 195, 190, 190),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: TextButton(
                    onPressed: (){signout(context);},
                      child: Row(
                        children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Sign Out',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),),
                            ),
                        ],
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ],));
  }
  void signout(BuildContext ctx) async{
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>MyLogin()), (route) => false);
  }
}