import 'package:cloud_firestore/cloud_firestore.dart';

import 'Child.dart';

class Task {
  Task({required this.task, required this.points, required this.deadline, required this.child, required this.needsConfirm, required this.isDone});

  late String task;
  late int points;
  late DateTime deadline;
  late Child child;
  late bool needsConfirm;
  late bool isDone;

  Task.fromSnapshot(snap) {
    task = snap.get('task');
    points = snap.get('points');
    Timestamp t = snap.get('deadline');
    deadline = t.toDate(); //DateTime.now();
    child = Child(UserId: '', firstName: '', lastName: '');
    needsConfirm = snap.get('needsconfirm');
    isDone = snap.get('isdone');
  }

  Map<String, dynamic> getData() => {'task': task, 'points': points, 'deadline': Timestamp.fromDate(deadline), 'child': child.UserId, 'needsconfirm': needsConfirm, 'isdone': isDone};
}
