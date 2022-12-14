import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';
import 'package:projekt/services/auth.dart';
import 'package:projekt/services/load_data_firebase.dart';
import 'package:projekt/services/user_service.dart';
import 'package:intl/intl.dart';

class ParentHomepage extends StatefulWidget {
  const ParentHomepage({super.key});

  @override
  State<ParentHomepage> createState() => _ParentHomepageState();
}

late Map<String, dynamic> userData;
final FirebaseAuth _auth = FirebaseAuth.instance;
final DateTime datenow = DateTime.now();

printDate() {
  //String result = "";
  //result = datenow.month.toString();
  String formatDate(DateTime datenow) => DateFormat("MMMM d").format(datenow);
  print(formatDate(datenow));
}

class _ParentHomepageState extends State<ParentHomepage> {
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
          SizedBox(height: 30),
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
                userData = await LoadDataFirebase.getDocumentUser(a!.uid);
                if (userData.containsKey("hasfamily")) {
                  if (userData["hasfamily"] = true) {
                    print("gangster");
                  }
                }
                //familyData = await LoadDataFirebase.getDocumentFamily(userData["familyid"]);
                //UsersService.setFamily(userData["lastname"], userData["familyid"]);
                //print(familyData.toString());
                //print(data.toString());
                //await LoadDataFirebase.setHasFamily(a!.uid);
              },
              child: Text("print!!!")),
          TextButton(
              onPressed: () {
                AutoRouter.of(context).push(JRouter());
              },
              child: Text("create family")),
          TextButton(
              onPressed: () async {
                await _auth.signOut();
                setState(() {});
                context.router.replace(SignInPageRoute());
              },
              child: Text("signout"))
        ],
      ),
    );
  }
}
