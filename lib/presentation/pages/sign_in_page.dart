import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/register_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/services/auth.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final themeData = ThemeData();
  final AuthService _auth = AuthService();

  String userNameEntered = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Sign in", style: TextStyle(color: Colors.white) //themeData.textTheme.headline1,
                )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(labelText: "Username"),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                _emailController.text = text;
                //userNameEntered = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                _passwordController.text = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () async {
                context.router.push(HRouter());

                // for future login with username and password

                /*dynamic result = await _auth.signInWithEmailPassword(_emailController, _passwordController);
                if (result == null) {
                  print("signing in failed");
                } else {
                  result = result as User;
                  print(result.email);
                  context.router.push(HRouter());
                }*/
              },
              child: Text("Log in"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you are new?"),
              TextButton(
                  onPressed: () {
                    context.router.push(RRouter());
                  },
                  child: Text("sign in!"))
            ],
          )
        ],
      ),
    );
  }
}
