import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/homepage.dart';
import 'package:shop/login.dart';
import 'package:shop/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    waiting();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('images/icon.jpg', height: 100,),),
    );
  }

  @override
  void dispose(){

    super.dispose();
  }

  Future<void> waiting() async{
    await Future.delayed(Duration(seconds: 2));
    final sharedPrefs = await SharedPreferences.getInstance();
    var check = await sharedPrefs.getString('email');
    if(check==null){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: ((context) => MyLogin())
    ));}
    else{
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: ((context) => HomePage())
    ));
    }
  }
}