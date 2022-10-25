import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();

  // sign in anon

  Future signInAnon(TextEditingController email, TextEditingController password) async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailPassword(TextEditingController email, TextEditingController password) async {
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

  //sign in with email with password

  //register with email and password

  //sign out
}
