import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/task.dart';
import 'package:projekt/services/user_service.dart';

class ChildConfirmTaskPage extends StatefulWidget {
  const ChildConfirmTaskPage({super.key});

  @override
  State<ChildConfirmTaskPage> createState() => _ChildConfirmTaskPageState();
}

class _ChildConfirmTaskPageState extends State<ChildConfirmTaskPage> {
  List<Task>? tasks;

  void initState() {
    super.initState();

    String familyId = UsersService.family!.getFamilyId().toString().trim(); // UsersService.family.getFamilyId();

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').where('child', isEqualTo: UsersService.member!.UserId).where('needsconfirm', isEqualTo: true).snapshots().listen((event) {
      tasks = [];
      for (var element in event.docs) {
        tasks!.add(Task.fromSnapshot(element));
      }
      setState(() {});
    });
  }

  needsNoMoreConfirmation(String taskId) {
    String familyId = UsersService.family!.getFamilyId().toString().trim();
    print("familyId: ${familyId}");
    print("taskId: ${taskId}");
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').doc(taskId);
    doc.update({"needsconfirm": false}).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null || !UsersService.loadedstatus.value
        ? Text('Loading...')
        : Scaffold(
            appBar: AppBar(title: Text("My tasks"), centerTitle: true),
            body: ListView.builder(
                itemBuilder: (ctx, i) {
                  Task task = tasks![i];
                  bool done = false;
                  return Card(
                    child: CheckboxListTile(
                      title: Text(task.task),
                      subtitle: Text('Points: ${task.points}'),
                      onChanged: (bool? value) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Are you done with the task?",
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
                                    needsNoMoreConfirmation(task.taskId.trim());
                                  },
                                  child: Text("done!")),
                            ],
                          ),
                        );
                      },
                      value: (!task.needsConfirm),
                    ),
                  );
                },
                itemCount: tasks!.length),
          );
  }
}
