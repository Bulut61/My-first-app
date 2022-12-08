import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projekt/services/user_service.dart';

import '../../family_classes/task.dart';
import 'package:intl/intl.dart';

class TasksBottomPage extends StatefulWidget {
  const TasksBottomPage({super.key});

  @override
  State<TasksBottomPage> createState() => _TasksBottomPageState();
}

class _TasksBottomPageState extends State<TasksBottomPage> {
  List<Task>? tasks;

  @override
  void initState() {
    super.initState();

    String familyId = UsersService.family!.getFamilyId().toString().trim(); // UsersService.family.getFamilyId();

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('tasks').where('child', isEqualTo: UsersService.member!.UserId).snapshots().listen((event) {
      tasks = [];
      for (var element in event.docs) {
        tasks!.add(Task.fromSnapshot(element));
      }
      setState(() {});
    });
  }

  String formatDatetime(DateTime date) {
    String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);
    return formatDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null || !UsersService.loadedstatus.value
        ? Text('Loading...')
        : Scaffold(
            appBar: AppBar(title: Text("My Tasks"), centerTitle: true),
            body: ListView.builder(
                itemBuilder: (ctx, i) {
                  Task task = tasks![i];
                  return task.deadline.isBefore(DateTime.now())
                      ? SizedBox.shrink()
                      : Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.task_rounded,
                              color: Colors.blue,
                            ),
                            title: Text(task.task),
                            subtitle: Text('Points: ${task.points},    due: ${formatDatetime(task.deadline)}'),
                          ),
                        );
                },
                itemCount: tasks!.length),
          );
  }
}
