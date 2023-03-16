import 'package:flutter/material.dart';
import 'splash.dart';
void main(){
  runApp(shop());
}

class shop extends StatelessWidget {
  const shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),
      home: Splash(),
    );
  }
}