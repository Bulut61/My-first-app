import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/family_classes/family.dart';
import 'package:projekt/family_classes/parent.dart';

class UsersService {
  static late FamMember member;
  static late Family family;
  static bool isParent = false;

  static void setFamily(String familyName, String familyId, String parentsFirstName, String parentsLastName, String parentsUserId) {
    family = Family(familyName: familyName, familyId: familyId, parentsFirstName: parentsFirstName, parentsLastName: parentsLastName, parentsUserId: parentsUserId);
  }

  static void setMember(String firstNaMe, String lastName, String UserId) {
    member = FamMember(firstName: firstNaMe, lastName: lastName, UserId: UserId);
  }

  static void memberIsParent(String fName, String lName, String uid) {
    member = Parent(fName: fName, lName: lName, uid: uid);
    isParent = true;
  }

  static void memberIsChild(String fName, String lName, String uid) {
    member = Child(firstName: fName, lastName: lName, UserId: uid);
    isParent = false;
  }

  static FamMember getMember() {
    return member;
  }

  static Family getFamily() {
    return family;
  }

  static setIsParent() {
    isParent = true;
  }
}
