// ignore_for_file: prefer_const_constructors

// import 'package:application/widgets/CurrentUserProvider.dart';
// import 'package:application/widgets/authentication/ForgotPassword.dart';
// import 'package:application/widgets/authentication/Signup.dart';
// import 'package:application/widgets/firebase_functions/firebase_fun.dart';

import 'package:application/AppBloc.dart';
import 'package:application/FirebaseFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

// import 'package:or/or.dart';
import 'package:transparent_image/transparent_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  bool visibility = true;
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child: Image.network(
                      "https://i.pinimg.com/originals/d5/69/12/d56912e297cf3a797d5d5c728a23fda9.gif",
                      // https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8e/16/91/caption.jpg?w=1200&h=1200&s=1

                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(40)

                            // topStart: Radius.circular(40),
                            // bottomStart: Radius.circular(40)
                            ),
                    color: Colors.grey.shade100),
                child: SingleChildScrollView(
                    child: Form(
                        key: _formState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Welcome to our App! Please sign in to continue",
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
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5)),
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
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.center,
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5)),
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
                                bottom: 10,
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

                            Container(
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
                                    print("tapped");
                                    if (_formState.currentState!.validate()) {
                                      print(
                                          "email is ${_emailController.text.trim()} ${_passwordController.text.trim()}");
                                      signInWithEmailAndPassword(
                                          context: context,
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim());
                                    }
                                  },
                                  child: context
                                          .watch<CurrentUserProvider>()
                                          .isLoading
                                      ? LoadingAnimationWidget
                                          .staggeredDotsWave(
                                              color: Colors.white, size: 25)
                                      : Text(
                                          "Login",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                )),
                            // Container(
                            //   margin: EdgeInsets.only(bottom: 5),
                            //   alignment: Alignment.center,
                            //   height: 40,
                            //   width: MediaQuery.of(context).size.width * 0.25,
                            //   decoration: BoxDecoration(
                            //       borderRadius:
                            //           BorderRadiusDirectional.circular(10)),
                            //   child: TextButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => SignUp()));
                            //     },
                            //     child: Text(
                            //       "Create account ",
                            //       style: GoogleFonts.abel(
                            //         color: Colors.blue.shade300,
                            //         fontSize: 18,
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // end of text fields
                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
