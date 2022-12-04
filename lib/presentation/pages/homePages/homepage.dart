import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/parent.dart';
import 'package:projekt/presentation/pages/homePages/child_homepage.dart';
import 'package:projekt/presentation/pages/homePages/confirm_task_page.dart';
import 'package:projekt/presentation/pages/homePages/parent_Homepage.dart';
import 'package:projekt/presentation/pages/homePages/pocket_money_page.dart';
import 'package:projekt/presentation/pages/homePages/shopping_list_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';
import 'package:projekt/services/load_data_firebase.dart';
import 'package:projekt/services/user_service.dart';
import '../../../services/auth.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState() {
    super.initState();
    getUserAndFamilyObj();
  }

  late Map<String, dynamic> userdoc;
  late Map<String, dynamic> userData;
  late Map<String, dynamic> familyData;
  late List<dynamic> familyMembers;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final User? user;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: UsersService.loadedstatus,
      builder: (context, value, child) {
        if (!UsersService.loadedstatus.value) {
          return Text("loading...");
        } else {
          return getPage();
        }
      },
    );
  }

  Widget getPage() {
    return ValueListenableBuilder(
      valueListenable: UsersService.isParentstatus,
      builder: (context, value, child) {
        if (UsersService.isParentstatus.value) {
          return ParentHomepage();
        } else {
          return ChildHomePage();
        }
      },
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

  getUserAndFamilyObj() async {
    String id = await AuthService.getUserId();
    userData = await LoadDataFirebase.getDocumentUser(id);
    familyMembers = await LoadDataFirebase.getFamilyMembers(userData["familyid"]);
    familyData = await LoadDataFirebase.getDocumentFamily(userData["familyid"]);
    if (userData.containsKey("parent")) {
      if (userData["parent"] == true) {
        UsersService.isParentstatus.value = true;
        UsersService.memberIsParent(userData["firstname"], userData["lastname"], id);
      } else {
        UsersService.isParentstatus.value = false;
        UsersService.memberIsChild(userData["firstname"], userData["lastname"], id);
      }
    }
    UsersService.setFamily(familyData["name"], userData["familyid"]);
    await UsersService.buildFamily(familyMembers);
  }
}
