import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/task.dart';
import 'package:projekt/services/user_service.dart';

class ConfirmTaskPage extends StatefulWidget {
  const ConfirmTaskPage({super.key});

  @override
  State<ConfirmTaskPage> createState() => _ConfirmTaskPageState();
}

class _ConfirmTaskPageState extends State<ConfirmTaskPage> {
  List<Task>? tasks;

  void initState() {
    super.initState();

    String familyId = UsersService.family!.getFamilyId().toString().trim(); // UsersService.family.getFamilyId();

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').where('needsconfirm', isEqualTo: false).where('isdone', isEqualTo: false).snapshots().listen((event) {
      tasks = [];
      for (var element in event.docs) {
        tasks!.add(Task.fromSnapshot(element));
      }
      setState(() {});
    });
  }

  isDone(String taskId) {
    String familyId = UsersService.family!.getFamilyId().toString().trim();
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').doc(taskId);
    doc.update({"isdone": true}).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null || !UsersService.loadedstatus.value
        ? Text('Loading...')
        : Scaffold(
            appBar: AppBar(title: Text("Confirm tasks"), centerTitle: true),
            body: ListView.builder(
                itemBuilder: (ctx, i) {
                  Task task = tasks![i];
                  return Card(
                    child: CheckboxListTile(
                      title: Text(task.task),
                      subtitle: Text('Points: ${task.child.firstName}'),
                      onChanged: (bool? value) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "is the Task done?",
                              style: TextStyle(fontSize: 14),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("cancel")),
                              TextButton(
                                  onPressed: () {
                                    print(task.taskId);
                                    setState(() {
                                      task.needsConfirm = (!value!);
                                    });
                                    Navigator.pop(context);
                                    tasks?.removeAt(i);
                                    isDone(task.taskId);
                                    assignPoints(task);
                                  },
                                  child: Text("assign points!")),
                            ],
                          ),
                        );
                      },
                      value: task.needsConfirm,
                    ),
                  );
                },
                itemCount: tasks!.length),
          );
  }

  void assignPoints(Task task) {
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('users').doc(task.child.UserId);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(doc);
      final newPoints = snapshot.get('points') + task.points;
      transaction.update(doc, {'points': newPoints});
    }).then(
      (value) => print("DocumentSnapshot successfully updated!"),
      onError: (e) => print("Error updating document $e"),
    );
  }
}
