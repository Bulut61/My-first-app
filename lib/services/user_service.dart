import 'package:flutter/material.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/family_classes/family.dart';
import 'package:projekt/family_classes/parent.dart';

import 'load_data_firebase.dart';

class UsersService {
  static late FamMember member;
  static late Family family;
  static bool isParent = false;
  static ValueNotifier<bool> loadedstatus = ValueNotifier<bool>(false);
  static ValueNotifier<bool> isParentstatus = ValueNotifier<bool>(false);

  static void setFamily(String familyName, String familyId) {
    family = Family(familyName: familyName, familyId: familyId);
  }

  static Future buildFamily(List<dynamic> familyMembers) async {
    familyMembers.forEach((element) async {
      Map<String, dynamic> userdoc = await LoadDataFirebase.getDocumentUser(element);
      if (userdoc["parent"]) {
        print("user: ${userdoc["firstname"]}");
        Parent parent = Parent(fName: userdoc["firstname"], lName: userdoc["lastname"], uid: element);
        UsersService.addParrentToFamily(parent);
      } else {
        Child child = Child(firstName: userdoc["firstname"], lastName: userdoc["lastname"], UserId: element);
        UsersService.addChildToFamily(child);
      }
      loadedstatus.value = true;
      setState() {}
    });
  }

  static void addChildToFamily(Child child) {
    family.addChild(child.firstName, child.lastName, child.UserId);
  }

  static void addParrentToFamily(Parent parent) {
    family.addParent(parent.firstName, parent.lastName, parent.UserId);
  }

  static void setMember(String firstNaMe, String lastName, String UserId) {
    member = FamMember(firstName: firstNaMe, lastName: lastName, UserId: UserId);
  }

  static void memberIsParent(String fName, String lName, String uid) {
    member = Parent(fName: fName, lName: lName, uid: uid);
  }

  static void memberIsChild(String fName, String lName, String uid) {
    member = Child(firstName: fName, lastName: lName, UserId: uid);
  }

  static FamMember getMember() {
    return member;
  }

  static Family getFamily() {
    return family;
  }
}
