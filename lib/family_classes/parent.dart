import 'package:projekt/family_classes/fam_member.dart';

class Parent extends FamMember {
  //Parent({required this.firstName, required this.lastName, required this.UserId}) : super(firstName: '', lastName: '', UserId: '');

  Parent({required String fName, required String lName, required String uid}) : super(firstName: fName, lastName: lName, UserId: uid);
}
