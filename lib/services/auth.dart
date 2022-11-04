import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static late User? _currentUser;
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();

  // sign in anon

  static Future signInAnon(TextEditingController email, TextEditingController password) async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future signInWithEmailPassword(TextEditingController email, TextEditingController password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      User? user = credential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future signOut() async {
    await _auth.signOut();
  }

  static User? getUser() {
    return _auth.currentUser;
  }

  static String getUserId() {
    return _auth.currentUser!.uid;
  }

  static String? getUserEmail() {
    return _auth.currentUser!.email;
  }

  //sign in with email with password

  //register with email and password

  //sign out
}
