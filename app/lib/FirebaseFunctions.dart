//  sign in  with email and password

import 'dart:async';

import 'package:app/AppBloc.dart';
import 'package:app/Homepage.dart';
import 'package:app/VerifyEmail.dart';
import 'package:app/globals.dart';
import 'package:app/main.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
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
dynamic user;
String _getErrorMessage(String errorCode) {
  return Globals().authErrors[errorCode] ?? "an  undefined error happened";
}

var alertStyle = AlertStyle(
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

// error codes

// sign in with email and  password
Future<void> signInWithEmailAndPassword({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  context.read<CurrentUserProvider>().changeIsLoading();

  try {
    await Future.delayed(Duration(seconds: 2));

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "Homepage")));
    print("Email signup is $email");
  } on FirebaseAuthException catch (e) {
    // Map FirebaseAuthException codes to user-friendly messages
    final errorMessage = _getErrorMessage(e.code);

    CherryToast.warning(
      toastPosition: Position.top,
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 500),
      title: Text('Sign up Error',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      action: Text(errorMessage, style: GoogleFonts.abel()),
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
    context.read<CurrentUserProvider>().changeIsLoading();
    await Future.delayed(Duration(seconds: 2));

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email_, password: password_);

    user = userCredential.user!;

    await user.sendEmailVerification();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VerifyEmail(email: email_)));
  } on FirebaseAuthException catch (e) {
    String _error = _getErrorMessage(e.code);
    CherryToast.warning(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 200),
      title: Text('Email Error',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      action: Text(
        _error,
        style: GoogleFonts.abel(),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  } finally {
    context.read<CurrentUserProvider>().changeIsLoading();
  }
}



Future<void> resendLink() async{
 await user.sendEmailVerification();
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



class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    print("Starting Google Sign-In");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      print("Google Sign-In account retrieved: ${googleSignInAccount != null}");

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
          print("Google Sign-In successful: ${user?.email}");

          Globals().switchScreens(
              context: context, screen: MyHomePage(title: "Homepage"));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            print('The account already exists with a different credential.');
            // Handle the error accordingly in your app
          } else if (e.code == 'invalid-credential') {
            print('The credential received is malformed or has expired.');
            // Handle the error accordingly in your app
          } else {
            print('FirebaseAuthException: ${e.message}');
            // Handle other FirebaseAuthException errors accordingly in your app
          }
        } catch (e) {
          print("Google sign-up error: $e");
          // Handle other errors accordingly in your app
        }
      } else {
        print("Google Sign-In was canceled by the user.");
        // Handle the scenario where the user cancels the Google Sign-In
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      // Handle errors related to Google Sign-In process
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
