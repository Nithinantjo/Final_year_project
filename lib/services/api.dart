import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/user_model.dart';

const baseURL = "http://10.0.2.2:3000";

class APIService {
  static var client = http.Client();


  static createAccount(UserModel user) async {
  Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/signup"),
    headers: requestHeaders,
    body:
     json.encode(user.toJson())
    );
  }

  static login(String email, String pass) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/login"),
    headers: requestHeaders,
    body: 
      jsonEncode({
        "email": email,
        "password": pass
      }));
      return response;
  }
  
}