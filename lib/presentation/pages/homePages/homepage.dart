import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/homePages/confirm_task_page.dart';
import 'package:projekt/presentation/pages/homePages/pocket_money_page.dart';
import 'package:projekt/presentation/pages/homePages/shopping_list_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';
import 'package:projekt/services/load_data_firebase.dart';
import '../../../services/auth.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final User? user;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                setState(() {});
                context.router.replace(SignInPageRoute());
              },
              icon: Icon(Icons.logout, semanticLabel: "log out"))
        ],
        centerTitle: true,
        title: Text(
          "Family App",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 60),
          CustomButton(
              onPressed: () {
                AutoRouter.of(context).push(TaskPageRoute());
                //print(AutoRouter.of(context).stack);
              },
              text: "Create Task",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                AutoRouter.of(context).push(ShoppingListPageRoute());
                /*Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ShoppingListPage(),
                    ));*/
              },
              text: "Shopping list",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                AutoRouter.of(context).push(ConfirmTaskPageRoute());
              },
              text: "Confirm Task",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                AutoRouter.of(context).push(PocketMoneyPageRoute());
              },
              text: "Pocket Money",
              buttonColor: themeData.colorScheme.primary),
          TextButton(
              onPressed: () async {
                User? a = AuthService.getUser();
                //print(a?.uid);
                //TODO delete just for testing purposes
                //await hasFamily();
                //print(await getIdOfCurrentUser());
                //print(xy);
                //await setHasFamily();
                await LoadDataFirebase.setHasFamily();
              },
              child: Text("print!!!")),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(JRouter());
              },
              child: Text("create family")),
          TextButton(onPressed: () {}, child: Text("change has family status"))
        ],
      ),
    );
  }

  getCurrentUserDELELTEME() async {
    try {
      user = _auth.currentUser;
      print(user?.uid);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("User is not logged in"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.router.replace(SignInPageRoute());
                      },
                      child: Text("login"))
                ],
              ));
    }
  }

  Future setHasFamily() async {
    String UserId = "";
    UserId = await getIdOfCurrentUser();
    if (UserId.length < 1) {
      print("setHasFamily userId length is invalid");
    } else {
      await FirebaseFirestore.instance.collection('users').doc(UserId).update({"hasfamily": true}).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
    }
  }

  Future<String> getIdOfCurrentUser() async {
    String? currentUserEmail = AuthService.getUserEmail();
    String id = "";
    await FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if ((doc["email"]) == currentUserEmail) {
          id = doc.id;
        }
      });
    });
    if (id.length < 1) {
      return id;
    }
    return id;
  }

  //TODO delete just for testing purposes
  Future hasFamily() async {
    String? currentUserEmail = AuthService.getUserEmail();
    //String x = await FirebaseFirestore.instance.collection('users').get().toString();
    //return x;
    await FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if ((doc["email"]) == currentUserEmail) {
          print((doc["email"]) + " " + (doc["firstname"]) + " " + (doc["hasfamily"]).toString() + " " + doc.id);
        }
        //print("x: " + currentUserEmail!);
        //print(doc["email"]);
      });
    });
  }
}
