import 'package:api/controller/provider/loginProvider.dart';
import 'package:api/controller/provider/signUpProvider.dart';
import 'package:api/view/loginScreen.dart';
import 'package:api/view/playListScreen.dart';
import 'package:api/view/playList_TexF_Screen.dart';
import 'package:api/view/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(My());
}

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>LoginProvider() ,),
        ChangeNotifierProvider(create: (context) =>SignUpProvider() ,),
        
      ],

      child: MaterialApp(
        // home: LoginScreen(),
        home: SignUpScreen(),
        // home: PlayListScreen(),
        // home: PlayList_TexF_Screen(),
      ),
    );
  }
}
