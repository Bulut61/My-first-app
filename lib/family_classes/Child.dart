class Child {
  Child({required this.firstName, required this.lastName, required this.UserId});
  String UserId;
  String firstName;
  String lastName;
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
