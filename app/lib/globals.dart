import 'dart:async';

import 'package:app/DocsVerification.dart';
import 'package:app/Homepage.dart';
import 'package:app/Welcome.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Globals {
  double raduis = 20.0;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> initUserDb() async {
    await Globals()
        .firebaseFirestore
        .collection("${Globals().auth.currentUser?.email}")
        .doc(Globals().auth.currentUser?.email)
        .set({
      "createdOn": FieldValue.serverTimestamp(),
      "doc": "",
      "docUrl": "",
      "docVerified": false,
    });
  }

  Future<void> slowSwitchScreens(
      {required BuildContext context, required Widget screen}) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration:
            Duration(seconds: 1), // Increase duration for a smoother transition
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final opacityTween = Tween(begin: 0.0, end: 1.0);
          final scaleTween = Tween(
              begin: 0.95,
              end: 1.0); // Slight scale transition for ambient effect
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Use easeInOut for a smoother transition
          );

          return FadeTransition(
            opacity: opacityTween.animate(curvedAnimation),
            child: ScaleTransition(
              scale: scaleTween.animate(curvedAnimation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Future<void> switchScreens(
      {required BuildContext context, required Widget screen}) {
    try {
      return Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(
                milliseconds:
                    600), // Increase duration for a smoother transition
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final opacityTween = Tween(begin: 0.0, end: 1.0);
              final scaleTween = Tween(
                  begin: 0.95,
                  end: 1.0); // Slight scale transition for ambient effect
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve:
                    Curves.easeInOut, // Use easeInOut for a smoother transition
              );

              return FadeTransition(
                opacity: opacityTween.animate(curvedAnimation),
                child: ScaleTransition(
                  scale: scaleTween.animate(curvedAnimation),
                  child: child,
                ),
              );
            },
          ));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future checkDocVerified({required BuildContext context}) async {
    try {
      String? email = Globals().auth.currentUser?.email;

      DocumentReference docRef =
          FirebaseFirestore.instance.collection("$email").doc(email);

      // Fetch the document
      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Cast the data to a Map<String, dynamic>
        Map<String, dynamic>? data =
            docSnapshot.data() as Map<String, dynamic>?;

        // Check if the 'docVerified' field exists and its value is true
        bool isDocVerified = data?['docVerified'] == true;

        if (isDocVerified) {
          print("The document is verified.");
          switchScreens(context: context, screen: WelcomeScreen());
        } else {
          print(
              "The document is not verified or 'docVerified' field is missing.");
          switchScreens(context: context, screen: Docsverification());
        }
      } else {
        print("Document does not exist.");
      }
    } catch (e) {
      print("Error checking 'docVerified': $e");
    }
  }

  void nointernet({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No internet connection'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void warningsAlerts(
      {required String title,
      required String content,
      required BuildContext context}) {
    CherryToast.warning(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 200),
      title: Text(
        '$title',
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      ),
      action: Text(
        content,
        style: GoogleFonts.abel(),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  }

  void successAlerts(
      {required String title,
      required String content,
      required BuildContext context}) {
    CherryToast.success(
      disableToastAnimation: false,
      animationCurve: Curves.ease,
      animationDuration: Duration(milliseconds: 500),
      title: Text('$title',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      action: Text(
        "$content",
        style: GoogleFonts.abel(fontWeight: FontWeight.w400),
      ),
      actionHandler: () {},
      onToastClosed: () {},
    ).show(context);
  }

  Widget imagesEdges(
      {required BuildContext context,
      required String image,
      required height,
      required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget circularWidget(
    ImageUrl,
    String text,
    MaterialPageRoute onpress,
  ) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(2),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onpress;
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                shape: BoxShape.circle, // Make the container circular
                image: DecorationImage(
                  fit: BoxFit
                      .contain, // Ensure the image covers the entire container
                  image: NetworkImage(
                    ImageUrl,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6, bottom: 6),
            child: Text(
              text,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Map authErrors = {
    "admin-restricted-operation":
        "This operation is restricted to administrators only.",
    "argument-error": "",
    "app-not-authorized":
        "This app, identified by the domain where it's hosted, is not authorized to use Firebase Authentication with the provided API key. Review your key configuration in the Google API console.",
    "app-not-installed":
        "The requested mobile application corresponding to the identifier (Android package name or iOS bundle ID) provided is not installed on this device.",
    "captcha-check-failed":
        "The reCAPTCHA response token provided is either invalid, expired, already used or the domain associated with it does not match the list of whitelisted domains.",
    "code-expired":
        "The SMS code has expired. Please re-send the verification code to try again.",
    "cordova-not-ready": "Cordova framework is not ready.",
    "cors-unsupported": "This browser is not supported.",
    "credential-already-in-use":
        "This credential is already associated with a different user account.",
    "custom-token-mismatch":
        "The custom token corresponds to a different audience.",
    "requires-recent-login":
        "This operation is sensitive and requires recent authentication. Log in again before retrying this request.",
    "dynamic-link-not-activated":
        "Please activate Dynamic Links in the Firebase Console and agree to the terms and conditions.",
    "email-change-needs-verification":
        "Multi-factor users must always have a verified email.",
    "email-already-in-use":
        "The email address is already in use by another account.",
    "expired-action-code": "The action code has expired. ",
    "cancelled-popup-request":
        "This operation has been cancelled due to another conflicting popup being opened.",
    "internal-error": "An internal error has occurred.",
    "invalid-app-credential":
        "The phone verification request contains an invalid application verifier. The reCAPTCHA token response is either invalid or expired.",
    "invalid-app-id":
        "The mobile app identifier is not registed for the current project.",
    "invalid-user-token":
        "This user's credential isn't valid for this project. This can happen if the user's token has been tampered with, or if the user isn't for the project associated with this API key.",
    "invalid-auth-event": "An internal error has occurred.",
    "invalid-verification-code":
        "The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.",
    "invalid-continue-uri":
        "The continue URL provided in the request is invalid.",
    "invalid-cordova-configuration":
        "The following Cordova plugins must be installed to enable OAuth sign-in: cordova-plugin-buildinfo, cordova-universal-links-plugin, cordova-plugin-browsertab, cordova-plugin-inappbrowser and cordova-plugin-customurlscheme.",
    "invalid-custom-token":
        "The custom token format is incorrect. Please check the documentation.",
    "invalid-dynamic-link-domain":
        "The provided dynamic link domain is not configured or authorized for the current project.",
    "invalid-email": "The email address is badly formatted.",
    "invalid-api-key":
        "Your API key is invalid, please check you have copied it correctly.",
    "invalid-cert-hash": "The SHA-1 certificate hash provided is invalid.",
    "invalid-credential":
        "The supplied auth credential is malformed or has expired.",
    "invalid-message-payload":
        "The email template corresponding to this action contains invalid characters in its message. Please fix by going to the Auth email templates section in the Firebase Console.",
    "invalid-multi-factor-session":
        "The request does not contain a valid proof of first factor successful sign-in.",
    "invalid-oauth-provider":
        "EmailAuthProvider is not supported for this operation. This operation only supports OAuth providers.",
    "invalid-oauth-client-id":
        "The OAuth client ID provided is either invalid or does not match the specified API key.",
    "unauthorized-domain":
        "This domain is not authorized for OAuth operations for your Firebase project. Edit the list of authorized domains from the Firebase console.",
    "invalid-action-code":
        "The action code is invalid. This can happen if the code is malformed, expired, or has already been used.",
    "wrong-password":
        "The password is invalid or the user does not have a password.",
    "invalid-persistence-type":
        "The specified persistence type is invalid. It can only be local, session or none.",
    "invalid-phone-number":
        "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].",
    "invalid-provider-id": "The specified provider ID is invalid.",
    "invalid-recipient-email":
        "The email corresponding to this action failed to send as the provided recipient email address is invalid.",
    "invalid-sender":
        "The email template corresponding to this action contains an invalid sender email or name. Please fix by going to the Auth email templates section in the Firebase Console.",
    "invalid-verification-id":
        "The verification ID used to create the phone auth credential is invalid.",
    "invalid-tenant-id": "The Auth instance's tenant ID is invalid.",
    "multi-factor-info-not-found":
        "The user does not have a second factor matching the identifier provided.",
    "multi-factor-auth-required":
        "Proof of ownership of a second factor is required to complete sign-in.",
    "missing-android-pkg-name":
        "An Android Package Name must be provided if the Android App is required to be installed.",
    "auth-domain-config-required":
        "Be sure to include authDomain when calling firebase.initializeApp(), by following the instructions in the Firebase console.",
    "missing-app-credential":
        "The phone verification request is missing an application verifier assertion. A reCAPTCHA response token needs to be provided.",
    "missing-verification-code":
        "The phone auth credential was created with an empty SMS verification code.",
    "missing-continue-uri": "A continue URL must be provided in the request.",
    "missing-iframe-start": "An internal error has occurred.",
    "missing-ios-bundle-id":
        "An iOS Bundle ID must be provided if an App Store ID is provided.",
    "missing-multi-factor-info": "No second factor identifier is provided.",
    "missing-multi-factor-session":
        "The request is missing proof of first factor successful sign-in.",
    "missing-or-invalid-nonce":
        "The request does not contain a valid nonce. This can occur if the SHA-256 hash of the provided raw nonce does not match the hashed nonce in the ID token payload.",
    "missing-phone-number":
        "To send verification codes, provide a phone number for the recipient.",
    "missing-verification-id":
        "The phone auth credential was created with an empty verification ID.",
    "app-deleted": "This instance of FirebaseApp has been deleted.",
    "account-exists-with-different-credential":
        "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.",
    "network-request-failed":
        "A network error (such as timeout, interrupted connection or unreachable host) has occurred.",
    "no-auth-event": "An internal error has occurred.",
    "no-such-provider":
        "User was not linked to an account with the given provider.",
    "null-user":
        "A null user object was provided as the argument for an operation which requires a non-null user object.",
    "operation-not-allowed":
        "The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.",
    "operation-not-supported-in-this-environment":
        'This operation is not supported in the environment this application is running on. "location.protocol" must be http, https or chrome-extension and web storage must be enabled.',
    "popup-blocked":
        "Unable to establish a connection with the popup. It may have been blocked by the browser.",
    "popup-closed-by-user":
        "The popup has been closed by the user before finalizing the operation.",
    "provider-already-linked":
        "User can only be linked to one identity for the given provider.",
    "quota-exceeded":
        "The project's quota for this operation has been exceeded.",
    "redirect-cancelled-by-user":
        "The redirect operation has been cancelled by the user before finalizing.",
    "redirect-operation-pending":
        "A redirect sign-in operation is already pending.",
    "rejected-credential":
        "The request contains malformed or mismatching credentials.",
    "second-factor-already-in-use":
        "The second factor is already enrolled on this account.",
    "maximum-second-factor-count-exceeded":
        "The maximum allowed number of second factors on a user has been exceeded.",
    "tenant-id-mismatch":
        "The provided tenant ID does not match the Auth instance's tenant ID",
    "timeout": "The operation has timed out.",
    "user-token-expired":
        "The user's credential is no longer valid. The user must sign in again.",
    "too-many-requests":
        "We have blocked all requests from this device due to unusual activity. Try again later.",
    "unauthorized-continue-uri":
        "The domain of the continue URL is not whitelisted.  Please whitelist the domain in the Firebase console.",
    "unsupported-first-factor":
        "Enrolling a second factor or signing in with a multi-factor account requires sign-in with a supported first factor.",
    "unsupported-persistence-type":
        "The current environment does not support the specified persistence type.",
    "unsupported-tenant-operation":
        "This operation is not supported in a multi-tenant context.",
    "unverified-email": "The operation requires a verified email.",
    "user-cancelled":
        "The user did not grant your application the permissions it requested.",
    "user-not-found":
        "There is no user record corresponding to this identifier. The user may have been deleted.",
    "user-disabled": "The user account has been disabled by an administrator.",
    "user-mismatch":
        "The supplied credentials do not correspond to the previously signed in user.",
    "user-signed-out": "",
    "weak-password": "The password must be 6 characters long or more.",
    "web-storage-unsupported":
        "This browser is not supported or 3rd party cookies and data may be disabled."
  };

  String getMimeType(String? extension) {
    switch (extension!.toLowerCase()) {
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'ppt':
        return 'application/vnd.ms-powerpoint';
      case 'pptx':
        return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
      case 'txt':
        return 'text/plain';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';
      case 'svg':
        return 'image/svg+xml';
      case 'mp3':
        return 'audio/mpeg';
      case 'wav':
        return 'audio/wav';
      case 'ogg':
        return 'audio/ogg';
      case 'json':
        return 'application/json';
      case 'xml':
        return 'application/xml';
      case 'html':
        return 'text/html';
      case 'css':
        return 'text/css';
      case 'js':
        return 'application/javascript';
      case 'zip':
        return 'application/zip';
      case 'rar':
        return 'application/x-rar-compressed';
      case '7z':
        return 'application/x-7z-compressed';
      case 'tar':
        return 'application/x-tar';
      case 'gz':
        return 'application/gzip';
      default:
        return 'application/octet-stream'; // Default for unknown file types
    }
  }
}
