import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/task.dart';
import 'package:projekt/services/auth.dart';
import 'package:projekt/services/load_data_firebase.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../../../services/user_service.dart';
import '../../widgets/custom_button.dart';

extension DateTimeExtension on DateTime {
  DateTime next(int day) {
    if (day == this.weekday) {
      return this.add(Duration(days: 7));
    } else {
      return this.add(
        Duration(
          days: (day - this.weekday) % DateTime.daysPerWeek,
        ),
      );
    }
  }
}

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
  late int taskPoints;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedvalue = "";
  String familyId = "";
  Child? selectedChild;

  Future createTask(Task task) async {
    DocumentReference<Map<String, dynamic>> doc;
    String famId = "";
    famId = UsersService.getFamily().getFamilyId();
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
          final TextEditingController _pointsEditingController = TextEditingController();
          final ThemeData themeData = Theme.of(context);
          var today = DateTime.now();
          var choosedDate;
          //final values = List.filled(7, false);
          List<bool> values = List.filled(7, false);
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
                      SizedBox(height: 8),
                      DropdownButton(
                          borderRadius: BorderRadius.circular(8),
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
                            selectedChild = UsersService.family.childs.firstWhere((element) => element.firstName == selectedvalue);
                            if (selectedChild != null) {
                              print(selectedChild?.firstName);
                            } else {
                              print("child not found");
                            }
                          }),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _pointsEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "Taskpoints"),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Which weekday",
                        style: TextStyle(color: themeData.colorScheme.primary),
                      ),
                      WeekdaySelector(
                          onChanged: (int day) {
                            setState(() {
                              values = List.filled(7, false, growable: false)..[day % 7] = true;
                              choosedDate = today.next(day % 7);
                            });
                          },
                          values: values),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Assign Task'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      taskName = _textEditingController.text;
                      taskPoints = int.parse(_pointsEditingController.text);
                      print(taskName);
                      Task task = Task(task: taskName, points: taskPoints, deadline: choosedDate, child: selectedChild!);
                      print("1");
                      await createTask(task);
                      print("2");
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
