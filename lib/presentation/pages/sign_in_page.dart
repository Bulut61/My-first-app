import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final themeData = ThemeData();

  String userNameEntered = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Sign in",
          style: themeData.textTheme.headline1,
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
                userNameEntered = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              keyboardType: TextInputType.text,
              onChanged: (text) {
                userNameEntered = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                context.router.replace(HomepageRoute());
                //print(userNameEntered);
              },
              child: Text("Log in"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("you are new?"), TextButton(onPressed: () {}, child: Text("sign in!"))],
          )
        ],
      ),

      /* SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              height: 10,
              width: 10,
              color: Colors.black,
            )
          ],
        ),
      ),*/
    );
  }
}
