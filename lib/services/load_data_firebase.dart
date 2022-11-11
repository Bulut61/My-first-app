import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';

class LoadDataFirebase {
  static Future setHasFamily() async {
    String UserId = "";
    UserId = await getIdOfCurrentUser();
    if (UserId.length < 1) {
      print("setHasFamily userId length is invalid");
    } else {
      await FirebaseFirestore.instance.collection('users').doc(UserId).update({"hasfamily": true}).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
    }
  }

  static Future<String> getFirstNameOfCurrentUser() async {
    String? currentUserEmail = AuthService.getUserEmail();
    String firstName = "";
    await FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if ((doc["email"]) == currentUserEmail) {
          firstName = (doc["firstname"]);
        }
      });
    });
    return firstName;
  }

  static Future<List<dynamic>> getFamilyMembers(String familyId) async {
    List<dynamic> memberList = [];
    final docref = await FirebaseFirestore.instance.collection('family').doc(familyId);
    await docref.get().then((value) {
      memberList = value.get('members');
      //print(a); //[FWOQyXHLiQ6xy ilker, x2csu2vvRE eminem]   runtimetype = List<dynamic>
    });
    return memberList;
  }

  static Future<String> getIdOfCurrentUser() async {
    String? currentUserEmail = AuthService.getUserEmail();
    String id = "";
    await FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if ((doc["email"]) == currentUserEmail) {
          id = doc.id;
        }
      });
    });
    if (id.length < 1) {
      return id;
    }
    return id;
  }
}
