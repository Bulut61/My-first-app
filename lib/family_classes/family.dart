import 'package:firebase_auth/firebase_auth.dart';
import 'package:projekt/family_classes/parent.dart';
import 'package:projekt/family_classes/task.dart';

import 'Child.dart';

class Family {
  String _FamilyName = "";
  String _FamilyId = "";
  int _FamilySize = 0;
  //late Map<String, Parent> parents;
  late List<Parent> parents;
  late List<Child> childs;
  late List<Task> tasks;

  Family({required String FamilyName, required String FamilyId, required String ParentsFirstName, required String ParentsLastName, required String ParentsUserId}) {
    _FamilyName = FamilyName;
    _FamilyId = FamilyId;
    _FamilySize = 1;
    parents.add(Parent(firstName: ParentsFirstName, lastName: ParentsLastName, UserId: ParentsUserId));
    //parents[ParentsUserId] = Parent(firstName: ParentsFirstName, lastName: ParentsLastName, UserId: ParentsUserId);
  }

  void addParent(String firstName, String lastName, String UserId) {
    parents.add(Parent(firstName: firstName, lastName: lastName, UserId: UserId));
    increaseFamilySize();
  }

  void addChild(String firstName, String lastName, String UserId) {
    childs.add(Child(firstName: firstName, lastName: lastName, UserId: UserId));
    increaseFamilySize();
  }

  void increaseFamilySize() {
    _FamilySize = _FamilySize + 1;
  }
}
