import 'package:api/controller/service/apiManager.dart';
import 'package:api/credential/snackBar.dart';
import 'package:api/view/loginScreen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  signUpPost(context, {name, email, password}) async{
    if (name.isEmpty) {
      snackBar(context, "Enter! Please Your Name");
    } else if (email.isEmpty) {
      snackBar(context, "Enter! Please Your Email");
    } else if (password.isEmpty) {
      snackBar(context, "Enter! Please Your Password");
    }
    else if (password.length<6) {
      snackBar(context, "Enter! Please Your 5 min Character");
    }
    else{
      isLoading = true;
      notifyListeners();

     await ApiManager.signUpPost(context,name: name,email: email,password: password);

      isLoading = false;
      notifyListeners();

      
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  }
}
