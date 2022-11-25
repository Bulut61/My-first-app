import 'package:cloud_firestore/cloud_firestore.dart';

import 'Child.dart';

class Task {
  Task({required this.task, required this.points, required this.deadline, required this.child});
  String task;
  int points;
  DateTime deadline;
  Child child;

  Map<String, dynamic> getData() => {'task': task, 'points': points, 'deadline': Timestamp.fromDate(deadline), 'child': child.UserId};
}
