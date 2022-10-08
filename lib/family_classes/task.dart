import 'Child.dart';

class Task {
  Task({required this.task, required this.points, required this.deadline, required this.child});
  String task;
  int points;
  DateTime deadline;
  Child child;
}
