import 'dart:convert';
 
import 'package:http/http.dart';
class ApiService{
   var client =  Client();
  Future login(String username,String password) async {
    // print(SessionManager.accessToken + coin);
    final response = await client.post(
      Uri.parse('https://pearlmngnt.com/mobileapp/login_app.php'),
      body: {'username': username,'password':password},
       
    );
    // print(response.body);
    final responseJson = jsonDecode(response.body);
     
    return responseJson;
  }

}