// ignore_for_file: prefer_const_constructors

// import 'package:widgets/CurrentUserProvider.dart';
// import 'package:widgets/authentication/ForgotPassword.dart';
// import 'package:widgets/authentication/Signup.dart';
// import 'package:widgets/firebase_functions/firebase_fun.dart';

import 'dart:async';
import 'dart:ui';

import 'package:app/AppBloc.dart';
import 'package:app/FirebaseFunctions/FirebaseFunctions.dart';
import 'package:app/authentication/SignUp.dart';
import 'package:app/authentication/SplashScreen.dart';
import 'package:app/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:or/or.dart';
import 'package:transparent_image/transparent_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title: Text(
          "Login",
          style: GoogleFonts.poppins(
              color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        leading: Container(
            margin: EdgeInsets.only(left: 10),
            width: 2,
            height: 2,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20))),
            child: IconButton(
                onPressed: () {
                  Globals()
                      .switchScreens(context: context, screen: Splashscreen());
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(40)

              // topStart: Radius.circular(40),
              // bottomStart: Radius.circular(40)
              ),
        ),
        child: Form(
            key: _formState,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Login to your Account",
                      style: GoogleFonts.abel(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Welcome to our App, Please login to continue",
                      style: GoogleFonts.abel(),
                    ),
                  ),

                  // form textfields

                  // GestureDetector(
                  //   onTap: () {
                  //     Authentication.signInWithGoogle(context: context);
                  //   },
                  //   child: Container(
                  //       margin: EdgeInsets.only(top: 10, bottom: 20),
                  //       alignment: Alignment.center,
                  //       height: 40,
                  //       width: MediaQuery.of(context).size.width * 0.25,
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius:
                  //               BorderRadiusDirectional.circular(5)),
                  //       child: FadeInImage.memoryNetwork(
                  //           placeholder: kTransparentImage,
                  //           image:
                  //               "https://miro.medium.com/freeze/fit/c/160/112/1*NyU8Hi9juxH7__nspK6erg.gif")

                  //       //  Image.network(
                  //       //     "https://miro.medium.com/freeze/fit/c/160/112/1*NyU8Hi9juxH7__nspK6erg.gif"),
                  //       ),
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * .25,
                  //   alignment: Alignment.center,
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.all(5),
                  //   child: Or(
                  //     fontSize: 8,
                  //     dividerThickness: 0.2,
                  //     dividerColor: Colors.black54,
                  //   ),
                  // ),

                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: TextFormField(
                      // keyboardType: TextInputType.name,
                      controller: _emailController,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        // setState(() {
                        //   email = value;
                        // });
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is empty";
                        }
                        if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: TextFormField(
                      obscureText: visibility,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        // setState(() {
                        //   password = value;
                        // });
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(CupertinoIcons.padlock_solid,
                            color: Colors.black54),
                        suffixIcon: IconButton(
                          icon: visibility
                              ? Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  color: Colors.black54,
                                )
                              : Icon(CupertinoIcons.eye_fill,
                                  color: Colors.black54),
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is Empty";
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    margin: EdgeInsets.only(
                      bottom: 5,
                    ),
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>

                        //             ForgotPassWord()));
                      },
                      child: Text("Forgot Password ?"),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (_formState.currentState!.validate()) {
                        print(
                            "email is ${_emailController.text.trim()} ${_passwordController.text.trim()}");

                        signInWithEmailAndPassword(
                            context: context,
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (_formState.currentState!.validate()) {
                          print(
                              "email is ${_emailController.text.trim()} ${_passwordController.text.trim()}");

                          signInWithEmailAndPassword(
                              context: context,
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.center,
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.green.shade500,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              if (_formState.currentState!.validate()) {
                                print(
                                    "email is ${_emailController.text.trim()} ${_passwordController.text.trim()}");

                                signInWithEmailAndPassword(
                                    context: context,
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim());
                              }
                            },
                            child:
                                context.watch<CurrentUserProvider>().isLoading
                                    ? LoadingAnimationWidget.staggeredDotsWave(
                                        color: Colors.white, size: 25)
                                    : Text(
                                        "Login",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                          )),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: GoogleAuthButton(
                        onPressed: () {
                          try {
                            Authentication.signInWithGoogle(context: context);
                          } catch (e) {}
                        },
                        themeMode: themeMode,
                        isLoading: isLoading,
                        style: AuthButtonStyle(
                          width: MediaQuery.of(context).size.width * 0.75,
                          textStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                          buttonType: buttonType,
                          iconType: iconType,
                        )),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      // alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: TextButton(
                        onPressed: () async {
                          Globals().switchScreens(
                              context: context, screen: SignUp());
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.abel(
                              color: Colors.blue.shade300,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  // end of text fields
                ],
              ),
            )),
      ),
    );
  }
}
