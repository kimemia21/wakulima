// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';

import 'package:app/AppBloc.dart';
import 'package:app/FirebaseFunctions.dart';
import 'package:app/authentication/LoginScreen.dart';
import 'package:app/authentication/SignUp.dart';
import 'package:app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:or/or.dart';
import 'package:transparent_image/transparent_image.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late StreamSubscription<List<ConnectivityResult>> subscription;
  bool isLoading = false;
  bool isConnected = false;
  bool darkMode = false;
  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;

  AuthButtonType? buttonType;
  AuthIconType? iconType;

  bool visibility = true;
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  final Connectivity _connectivity = Connectivity();
  // @override
  // void initState() {
  //   super.initState();
  //   // Use Future.microtask to delay the initial context usage
  //   Future.microtask(() => _checkInitialConnectivity());
  //   subscription = _connectivity.onConnectivityChanged
  //       .listen((ConnectivityResult> result) {
  //     final isConnected = result != ConnectivityResult.none;
  //     context.read<CurrentUserProvider>().changeInternetConnection(isConnected);
  //   });
  // }

  // Future<void> _checkInitialConnectivity() async {
  //   List<ConnectivityResult> result = await _connectivity.checkConnectivity();
  //   final isConnected = result != ConnectivityResult.none;
  //   context.read<CurrentUserProvider>().changeInternetConnection(isConnected);
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    subscription.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Signup",style: GoogleFonts.poppins(),),
      //   leading: Container(

      //       decoration: BoxDecoration(
      //         color: Colors.grey.shade200,
      //           borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
      //       child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back,color: Colors.black,)))
      // ,
      // ),
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 4, top: 4),
              child: Text(
                "Farming App",
                style: GoogleFonts.poppins(
                    color: Colors.green.shade500,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 4, top: 4),
              child: Text(
                "Welcome! Please Log In",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  child: Image.network(
                    "https://img.freepik.com/premium-vector/smart-technology-farming-concept_179970-1924.jpg",
                    // https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8e/16/91/caption.jpg?w=1200&h=1200&s=1

                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Text(
                "Continue With",
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,

              shadowColor: Colors.grey, // This sets the color of the shadow
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  // margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      Globals().switchScreens(
                          context: context, screen: LoginScreen());
                    },
                    child: Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey, // This sets the color of the shadow
                borderRadius: BorderRadius.circular(10),

                child: GoogleAuthButton(
                    onPressed: () {
                      Authentication.signInWithGoogle(context: context);
                    },
                    themeMode: themeMode,
                    isLoading: isLoading,
                    style: AuthButtonStyle(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 40,
                      textStyle: GoogleFonts.poppins(
                          color: Colors.black54, fontWeight: FontWeight.w600),
                      buttonType: buttonType,
                      iconType: iconType,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                // alignment: Alignment.center,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: TextButton(
                  onPressed: () async {
                    bool connection = await checkInternetConnection(context);

                    if (connection) {
                      Globals()
                          .switchScreens(context: context, screen: SignUp());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('No internet connection'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                        color: Colors.blue.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
