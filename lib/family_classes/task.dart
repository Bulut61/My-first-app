import 'package:cloud_firestore/cloud_firestore.dart';

import 'Child.dart';

class Task {
  Task({required this.task, required this.points, required this.deadline, required this.child});

  late String task;
  late int points;
  late DateTime deadline;
  late Child child;

  Task.fromSnapshot(snap) {
    task = snap.get('task');
    points = snap.get('points');
    deadline = DateTime.now();
    child = Child(UserId: '', firstName: '', lastName: '');
  }

  Map<String, dynamic> getData() => {'task': task, 'points': points, 'deadline': Timestamp.fromDate(deadline), 'child': child.UserId};
}
