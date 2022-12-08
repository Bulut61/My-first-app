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

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').where('child', isEqualTo: UsersService.member!.UserId).snapshots().listen((event) {
      tasks = [];
      event.docs.forEach((element) {
        tasks!.add(Task.fromSnapshot(element));
      });
      setState(() {});
    });
  }

  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return tasks == null || !UsersService.loadedstatus.value
        ? Text('Loading...')
        : Scaffold(
            appBar: AppBar(title: Text("My Tasks"), centerTitle: true),
            body: ListView.builder(
                itemBuilder: (ctx, i) {
                  Task task = tasks![i];
                  return Card(
                    child: CheckboxListTile(
                      title: Text(task.task),
                      subtitle: Text('Points: ${task.points}'),
                      onChanged: (bool? value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      value: _value,
                    ),
                  );
                },
                itemCount: tasks!.length),
          );
  }
}
