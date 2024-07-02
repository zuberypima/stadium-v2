import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/view/screens/homeScreen.dart';

class Authenticationservice {
  Future<void> CreateUserWithEmailAndPassword(
      context, String emailAddress, password) async {
    try {
      _showLoadingDialog(context);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homescreen()));
      //  nextPageNavigation(context, Homescreen());
      // Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signinUserWithEmailAndPassword(
      context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      // final UserCredential credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homescreen(),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // Log out Function
  Future<void> logoutService(context) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> addUserDetailToDataBase(String emailAddress, fullname) {
    return FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc(emailAddress)
        .set({
      "UserName": fullname,
      "Email": emailAddress,
      "PhoneNumber": "",
      "Ammount": ""
    });
  }

  Future<void> userPaymentMethod(
      String emailAddress, _phoneNumber, context) async {
    _showLoadingDialog(context);
    await FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc(emailAddress)
        .update({"PhoneNumber": _phoneNumber, "Ammount": "600000"});
  }

  checkForUser(context) async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        print(user!.email.toString());
      } else {
        print('User is signed in!');
      }
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              )),
        );
      },
    );
  }
}
