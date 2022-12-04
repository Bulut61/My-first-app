import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/family_classes/task.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';
import 'package:projekt/services/auth.dart';
import 'package:projekt/services/load_data_firebase.dart';
import 'package:projekt/services/user_service.dart';

class ChildHomePage extends StatefulWidget {
  const ChildHomePage({super.key});

  @override
  State<ChildHomePage> createState() => _ChildHomePageState();
}

late Map<String, dynamic> userData;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _ChildHomePageState extends State<ChildHomePage> {
  List<Task>? tasks;

  void initState() {
    super.initState();

    String familyId = UsersService.family.getFamilyId().toString().trim(); // UsersService.family.getFamilyId();

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').where('child', isEqualTo: UsersService.member.UserId).snapshots().listen((event) {
      tasks = [];
      event.docs.forEach((element) {
        tasks!.add(Task.fromSnapshot(element));
      });
      setState(() {});
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              onPressed: () async {
                AutoRouter.of(context).push(ChildConfirmTaskPageRoute());
              },
              text: "Completed Tasks",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                //AutoRouter.of(context).push(TaskPageRoute());
                //TODO
              },
              text: "Request item",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                //TODO
              },
              text: "Pocket money",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
