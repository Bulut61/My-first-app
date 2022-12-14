import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/homePages/homepage.dart';
import 'package:projekt/presentation/pages/register_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/services/auth.dart';

import '../../services/load_data_firebase.dart';
import '../../services/user_service.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Map<String, dynamic> userData;
  late Map<String, dynamic> familyData;
  final themeData = ThemeData();

  String userNameEntered = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late bool family;
  late StreamController<int> controller = StreamController();

  @override
  void initState() {
    super.initState();
    // TODO DELETE ME
    _emailController.text = "bulut@gmail.com";
    _passwordController.text = "bulut61";
    UsersService.resetService();
    //family = hasFamily();
  }

  //TODO routing for auth status
  @override
  Widget build(BuildContext context) {
    return _getSignInContent(); /*StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return _getSignInContent();
        }
      },
    );*/
  }

  Future<Widget> _homeOrCreateFamily() async {
    if (await hasFamily()) {
      print(hasFamily().toString());
    }
    return Homepage();
  }

  Future<bool> hasFamily() async {
    String? currentUserEmail = AuthService.getUserEmail();
    bool b = false;
    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if ((doc["email"]) == currentUserEmail) {
          //print((doc["email"]) + " " + (doc["firstname"]) + " " + (doc["hasfamily"]).toString());
          if ((doc["hasfamily"])) {
            b = true;
          }
        }
      });
    });
    return b;
  }

  Future<String> getFamilyId() async {
    return "";
  }

  Widget _getSignInContent() => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text("Sign in", style: TextStyle(color: Colors.white) //themeData.textTheme.headline1,
                  )),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
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
                  //context.router.push(HRouter());

                  // for future login with username and password

                  dynamic result = await AuthService.signInWithEmailPassword(_emailController, _passwordController);
                  if (result == null) {
                    print("signing in failed");
                  } else {
                    result = result as User;
                    print(result.email);
                    userData = await LoadDataFirebase.getDocumentUser(result.uid);
                    if (userData.containsKey("hasfamily")) {
                      if (userData["hasfamily"] = true) {}
                    }
                    if (userData.containsKey("familyid")) {
                      familyData = await LoadDataFirebase.getDocumentFamily(userData["familyid"]);
                      UsersService.setFamily(userData["lastname"], userData["familyid"]);
                      UsersService.loadedstatus.value = false;
                      context.router.push(HRouter());
                    } else {
                      context.router.replace(JRouter());
                    }
                  }
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
                    child: Text("register!")),
              ],
            )
          ],
        ),
      );
}
