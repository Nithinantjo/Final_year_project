import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash.dart';

late SharedPreferences sharedPrefs;
main() async{
  WidgetsFlutterBinding.ensureInitialized();
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