import 'package:api/controller/service/apiManager.dart';
import 'package:api/credential/snackBar.dart';
import 'package:api/view/signUpScreen.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading =false;
  loginPost(context,{email,password})async{
    if (email.isEmpty) {
      snackBar(context, "Enter! your Email");
    }
   else if (password.isEmpty) {
      snackBar(context, "Enter! your Password");
    }
    else if (password.length<6) {
      snackBar(context, "Enter! your min 5 Character");
    }
    else{

      isLoading = true;
      notifyListeners();
      
     await ApiManager.loginPost(context,email: email,password:password );

       isLoading = false;
      notifyListeners();
       
    }
  }
}