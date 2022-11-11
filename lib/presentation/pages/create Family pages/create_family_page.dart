import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/homePages/confirm_task_page.dart';
import 'package:projekt/presentation/pages/homePages/pocket_money_page.dart';
import 'package:projekt/presentation/pages/homePages/shopping_list_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';
import 'package:projekt/services/load_data_firebase.dart';

class CreateFamilyPage extends StatefulWidget {
  const CreateFamilyPage({super.key});

  @override
  State<CreateFamilyPage> createState() => _CreateFamilyPageState();
}

class _CreateFamilyPageState extends State<CreateFamilyPage> {
  TextEditingController _familyNameController = TextEditingController();
  TextEditingController _familyIdController = TextEditingController();

  void dispose() {
    _familyNameController.dispose();
    _familyIdController.dispose();
    super.dispose();
  }

  Future createFamilyFirebase(String FamilyName) async {
    String currentUserId = "";
    String currentUserFirstName = "";
    String format = ""; // id + " " + firstname;
    currentUserId = await LoadDataFirebase.getIdOfCurrentUser();
    currentUserFirstName = await LoadDataFirebase.getFirstNameOfCurrentUser();

    if (currentUserId.length < 1 || currentUserFirstName.length < 1) {
      print("create family failed");
      return;
    }
    format = currentUserId + " " + currentUserFirstName;
    var ref = await FirebaseFirestore.instance.collection('family').add({
      'name': FamilyName,
      'members': [format],
    }).catchError((error) => print("Failed to create family: $error"));
    print(ref.id);
  }

  Future joinFamilyFirebase(String familyId) async {
    String currentUserId = "";
    String currentUserFirstName = "";
    String format = ""; // id + " " + firstname;

    currentUserId = await LoadDataFirebase.getIdOfCurrentUser();
    currentUserFirstName = await LoadDataFirebase.getFirstNameOfCurrentUser();
    if (familyId.length < 2 || currentUserId.length < 1 || currentUserFirstName.length < 1) {
      print("join family failed");
      return;
    }
    format = currentUserId + " " + currentUserFirstName;
    await FirebaseFirestore.instance.collection('family').doc(familyId).update({
      "members": FieldValue.arrayUnion([format]),
    }).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
    LoadDataFirebase.setHasFamily();
    List<dynamic> mylist = await LoadDataFirebase.getFamilyMembers(familyId);
    mylist.forEach((element) {
      print(element.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.router.replace(SignInPageRoute());
              },
              icon: Icon(Icons.logout, semanticLabel: "log out"))
        ],
        centerTitle: true,
        title: Text(
          "Create or join Family",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          CustomButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Family name"),
                    content: TextFormField(
                      controller: _familyNameController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel")),
                      TextButton(
                          onPressed: () {
                            if (_familyNameController.text.length < 2) {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                          title: Text(
                                        "Family name to short!!! atleast 2 characters",
                                        style: TextStyle(fontSize: 12, color: Colors.red),
                                      ))));
                            } else {
                              createFamilyFirebase(_familyNameController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("ok"))
                    ],
                  ),
                );
              },
              text: "Create Family",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Id of Family"),
                    content: TextFormField(
                      controller: _familyIdController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel")),
                      TextButton(
                          onPressed: () {
                            if (_familyIdController.text.length < 2) {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                          title: Text(
                                        "Family ID to short!!! atleast 2 characters",
                                        style: TextStyle(fontSize: 12, color: Colors.red),
                                      ))));
                            } else {
                              joinFamilyFirebase(_familyIdController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("ok"))
                    ],
                  ),
                );
              },
              text: "Join Family",
              buttonColor: themeData.colorScheme.primary),
        ],
      ),
    );
  }
}
