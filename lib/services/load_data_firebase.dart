import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';

class LoadDataFirebase {
  static Future setHasFamily(String FamilyId) async {
    String UserId = "";
    String Id = FamilyId;
    UserId = await getIdOfCurrentUser();
    if (UserId.length < 1) {
      print("setHasFamily userId length is invalid");
    } else {
      await FirebaseFirestore.instance.collection('users').doc(UserId).update({
        "hasfamily": true,
        "familyid": FamilyId,
      }).then((value) => print("DocumentSnapshot successfully updated!"), onError: (e) => print("Error updating document $e"));
    }
  }

  static Future<String> getFirstNameOfCurrentUser() async {
    String firstName = "";
    await FirebaseFirestore.instance.collection('users').doc(AuthService.getUserId()).get().then((value) {
      firstName = value.get('firstname');
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

  static Future<String> getLastNameOfCurrentUser() async {
    String lastName = "";
    await FirebaseFirestore.instance.collection('users').doc(AuthService.getUserId()).get().then((value) {
      lastName = value.get('lastname');
    });
    return lastName;
  }

  static Future<bool> getHasFamily() async {
    bool hasfamily = false;
    await FirebaseFirestore.instance.collection('users').doc(AuthService.getUserId()).get().then((value) {
      hasfamily = value.get('hasfamily');
    }).onError((error, stackTrace) {
      print(error);
    }).catchError((onError) {
      print(onError);
    });
    return hasfamily;
  }

  static Future getDocumentUser(id) async {
    Map<String, dynamic> dat = new Map<String, dynamic>();
    final docRef = await FirebaseFirestore.instance.collection("users").doc(id);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        dat = doc.data() as Map<String, dynamic>;
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return dat;
  }
}
