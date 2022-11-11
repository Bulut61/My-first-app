import 'package:projekt/family_classes/fam_member.dart';

class Child extends FamMember {
  Child({required String firstName, required String lastName, required String UserId}) : super(firstName: '', lastName: '', UserId: '');
  int _points = 0;
  int _Allpoints = 0;

  void addPoints(int points) {
    _points = _points + points;
    _Allpoints = _Allpoints + points;
  }

  int getCurrentPoints() {
    return _points;
  }

  void resetPoints() {
    _points = 0;
  }
}
