import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/task.dart';
import 'package:projekt/services/auth.dart';
import 'package:projekt/services/load_data_firebase.dart';

import '../../../services/user_service.dart';
import '../../widgets/custom_button.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  void initState() {
    getList();
    super.initState();
  }

  List<String> list = <String>[];
  late String taskName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedvalue = "hallo";
  String familyId = "";

  Future createTask(Task task) async {
    DocumentReference<Map<String, dynamic>> doc;
    String famId = "";
    famId = UsersService.getFamily().getFamilyId();
    print("famId: " + famId);
    doc = await FirebaseFirestore.instance.collection("family").doc(famId);
    await doc.collection("tasks").add(task.getData());
  }

  getList() async {
    String familyId = "";
    String firstname = "";
    List<dynamic> familyList;
    List<dynamic> childsList;
    await FirebaseFirestore.instance.collection('users').doc(AuthService.getUserId()).get().then((value) {
      familyId = value.get('familyid');
    });
    familyList = await LoadDataFirebase.getFamilyMembers(familyId);
    familyList.forEach((element) async {
      if (!await LoadDataFirebase.getIsParent(element)) {
        firstname = await LoadDataFirebase.getFirstnameWithId(element);
        list.add(firstname);
        selectedvalue = list.first;
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 30),
        Center(
            child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      await showInformationDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), SizedBox(width: 5), Text('Add Task')],
                    )))),
        /*TextButton(
            onPressed: () async {
              await getList();
            },
            child: Text("testbutton")),*/
      ]),
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "What is the task"),
                      ),
                      DropdownButton(
                          hint: Text("Which child"),
                          value: selectedvalue,
                          isExpanded: true,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedvalue = val!;
                            });
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Choice Box"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked!;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      taskName = _textEditingController.text;
                      print(taskName);
                      Task task = Task(task: 'task', points: 2, deadline: DateTime.now(), child: Child(UserId: '3', firstName: '', lastName: ''));
                      await createTask(task);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }
}
