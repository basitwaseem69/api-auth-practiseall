import 'dart:convert';

import 'package:api/controller/service/endPoint.dart';
import 'package:api/credential/snackBar.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // Login (post method)...
  static loginPost(context, {email, password}) async {
    try {
      var url = Uri.parse(URL.BASE_URL + URL.loginEndPoint);
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      var res = jsonDecode(response.body);
      snackBar(context, res["message"]);
      print(response.body);
      return res;
    } catch (e) {
      snackBar(context, e.toString());
    }
  }

// signUp (post method),,,,,,,,,,,,,

 static signUpPost(context,{name,email,password}) async {
   try {
     var url = Uri.parse(URL.BASE_URL+URL.signUpEndPoint);
    var response = await http.post(url,body: {
    "name":name,
    "email":email,
    "password":password,
});
    var res = jsonDecode(response.body);
    snackBar(context, res["message"]);
    print(response.body);
    return res;
     
   } catch (e) {
     snackBar(context, e.toString());
   }
  }
}
