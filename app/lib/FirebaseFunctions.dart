//  sign in  with email and password

import 'dart:async';

import 'package:app/AppBloc.dart';
import 'package:app/main.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

FirebaseAuth _auth = FirebaseAuth.instance;

var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: GoogleFonts.abel(
    fontSize: 16,
  ),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  titleStyle: GoogleFonts.abel(fontSize: 18, fontWeight: FontWeight.bold),
  alertAlignment: Alignment.topCenter,
);

// sign in with email and  password
Future signInWithEmailAndPassword(
    {required BuildContext context,
    required String email,
    required String password}) async {
  try {
    context.read<CurrentUserProvider>().changeIsLoading();

    await _auth.signInWithEmailAndPassword(email: email, password: password);
    print("Email signup is $email");
  } on FirebaseAuthException catch (e) {
    CherryToast.warning(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 200),
      title: Text('Login Error',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      action: Text(
        e.code,
        style: GoogleFonts.abel(),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  } finally {
    context.read<CurrentUserProvider>().changeIsLoading();
  }
}

// signed in user

// function for creating account using email and password

Future signup(
    {required BuildContext context,
    required String email_,
    required String password_}) async {
  try {
    await _auth
        .createUserWithEmailAndPassword(email: email_, password: password_)
        .then((value) => FirebaseFirestore.instance
            .collection("users")
            .doc(email_)
            .set({"email": email_}))
        .then((value) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: "homepage"))));
  } on FirebaseAuthException catch (e) {
    CherryToast.warning(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 200),
      title: Text('Email Error',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      action: Text(
        e.code,
        style: GoogleFonts.abel(),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  }
}

Future<void> resetPassword({required context, required email}) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    Alert(
      context: context,
      style: alertStyle,
      title: "Email Reset",
      desc: "Sent Email Reset Link to $email",
      image: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image:
              "https://global.discourse-cdn.com/business7/uploads/jupiter/original/2X/c/c0297d064f2bfc5ecf73ad80efa3b288e88a80b9.gif",
          height: 200),
      buttons: [
        DialogButton(
          width: 300,
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red.shade200,
          radius: BorderRadius.circular(20.0),
        ),
      ],
    ).show();
  } on FirebaseAuthException catch (e) {
    return CherryToast.warning(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      width: 600,
      animationDuration: Duration(milliseconds: 200),
      title: Text('${e.message}', style: GoogleFonts.abel(fontSize: 18)),
      action: Text(
        e.code,
        style: GoogleFonts.abel(),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  }
}

final user = FirebaseAuth.instance.currentUser;

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }
}

// checking if stream has data

Future<int> getNextId() async {
  final DocumentReference counterRef =
      FirebaseFirestore.instance.collection('counters').doc('documentCounter');

  return FirebaseFirestore.instance
      .runTransaction((Transaction transaction) async {
    DocumentSnapshot snapshot = await transaction.get(counterRef);

    if (!snapshot.exists) {
      await transaction.set(counterRef, {'currentId': 1});
      return 1;
    }

    // Cast the snapshot data to Map<String, dynamic>
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    int currentId = data['currentId'];
    int nextId = currentId.toInt() + 1;

    transaction.update(counterRef, {'currentId': nextId});
    return nextId;
  });
}
