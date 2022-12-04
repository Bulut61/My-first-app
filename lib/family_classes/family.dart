import 'package:firebase_auth/firebase_auth.dart';
import 'package:projekt/family_classes/parent.dart';
import 'package:projekt/family_classes/task.dart';

import 'Child.dart';

class Family {
  String _familyName = "";
  String _familyId = "";
  int _familySize = 0;
  //late Map<String, Parent> parents;
  List<Parent> parents = [];
  List<Child> childs = [];
  List<Task> tasks = [];

  Family({required String familyName, required String familyId}) {
    _familyName = familyName;
    _familyId = familyId;
    _familySize = 1;
    //parents.add(Parent(fName: parentsFirstName, lName: parentsLastName, uid: parentsUserId));
    //parents[ParentsUserId] = Parent(firstName: ParentsFirstName, lastName: ParentsLastName, UserId: ParentsUserId);
  }

  getFamilyId() => _familyId;

  getFamilySize() => parents.length + childs.length;

  void addParent(String firstName, String lastName, String UserId) {
    parents.add(Parent(fName: firstName, lName: lastName, uid: UserId));
    increaseFamilySize();
  }

  void addChild(String firstName, String lastName, String UserId) {
    childs.add(Child(firstName: firstName, lastName: lastName, UserId: UserId));
    increaseFamilySize();
  }

  void increaseFamilySize() {
    _familySize = _familySize + 1;
  }

  String familyString() {
    String res;
    res = "familyname: " + _familyName + " " + "Family Id: " + _familyId + " parents: " + parents.toString() + " children: " + childs.toString();
    return res;
  }

  List getListParents() {
    return parents;
  }

  List getListOfChildren() {
    return childs;
  }
}
