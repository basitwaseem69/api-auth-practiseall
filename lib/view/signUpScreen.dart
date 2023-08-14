import 'package:api/controller/provider/signUpProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Builder(builder: (context) {
        var bloc = context.watch<SignUpProvider>();
        return bloc.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                //columnnn 1
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    SizedBox(height: 15),
                    Container(
                      // width: size.width * .5,
                      child: TextField(
                        controller: nameController,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                // columnn2
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("email"),
                    SizedBox(height: 15),
                    Container(
                      // width: size.width * .5,
                      child: TextField(
                        controller: emailController,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                      height: 30,
                    ),
                // column3
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password"),
                    SizedBox(height: 15),
                    Container(
                      // width: size.width * .5,
                      child: TextField(
                        controller: passwordController,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async{
                    var apiSignUp = context.read<SignUpProvider>();
                 await   apiSignUp.signUpPost(context,
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Container(
                      height: 30,
                      width: 50,
                      color: Colors.grey,
                      child: Center(child: Text("SignUp"))),
                ),
              ]);
      }),
    );
  }
}
