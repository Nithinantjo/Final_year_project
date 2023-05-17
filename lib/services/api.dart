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
  
  static showCart(String email) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/fromCart"),
    headers: requestHeaders,
    body: jsonEncode({
      "email": email
    })
    );

    return json.decode(response.body);
  }

  static increment(String email, String product) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.put(Uri.parse("$baseURL/inc"),
    headers: requestHeaders,
    body: jsonEncode({
      "email": email,
      "product": product
  })
    );
  }

  static decrement(String email, String product) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.put(Uri.parse("$baseURL/dec"),
    headers: requestHeaders,
    body: jsonEncode(
      {
        "email": email,
        "product": product
      }
    ) );
  }

  static addCart(String email, String product) async{
     Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/addCart"),
    headers: requestHeaders,
    body: jsonEncode(
      {
        "email": email,
        "product": product
      }
    ) );
  }

  static myOrders(String email) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/myorders"),
    headers: requestHeaders,
    body: jsonEncode({
      "email": email
    })
    );

    return json.decode(response.body);
  }

  static placeOrder(String email) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/placeorder"),
    headers: requestHeaders,
    body: jsonEncode({
      "email": email
    })
    );
  }

  
  static recommend(String prod) async{
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("http://192.168.1.38:5050/predict"),
    headers: requestHeaders,
    body: jsonEncode({
      "title": prod
    }));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  static eachProd(String prod) async {
    Map<String, String> requestHeaders = {'Content-Type' : 'application/json'};
    var response = await http.post(Uri.parse("$baseURL/eachproduct"),
    headers: requestHeaders,
    body: jsonEncode({
      "item" : prod
    }));
    if(response.body.isNotEmpty) {
    return json.decode(response.body);
}
return {};
  }

  
}