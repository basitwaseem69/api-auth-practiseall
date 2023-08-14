import 'package:api/controller/provider/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Builder(builder: (context) {
          var block = context.watch<LoginProvider>();
          return block.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
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
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    // 2 column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("password"),
                        SizedBox(
                          height: 15,
                        ),
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
                      onTap: () {
                        var api = context.read<LoginProvider>();
                        api.loginPost(context,email: emailController.text,password: passwordController.text);
                      },
                      child: Container(
                          height: 30,
                          width: 50,
                          color: Colors.grey,
                          child: Center(child: Text("Login"))),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
