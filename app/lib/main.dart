import 'package:app/AppBloc.dart';
import 'package:app/DocsVerification.dart';
import 'package:app/Homepage.dart';
import 'package:app/VerifyEmail.dart';
import 'package:app/Welcome.dart';
import 'package:app/authentication/LoginScreen.dart';
import 'package:app/authentication/SplashScreen.dart';
import 'package:app/contant.dart';
import 'package:app/firebase_options.dart';
import 'package:app/globals.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserProvider())
      ],
      child: MaterialApp(
          home:
          
           StreamBuilder<User?>(
              stream: Globals().auth.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                try {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.hexagonDots(
                          color: Colors.green, size: 30),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.emailVerified == true) {
                    return MyHomePage(title: "homepage");
                  } else if (snapshot.hasData && snapshot.data!.emailVerified) {
                    return VerifyEmail(
                        email: "${Globals().auth.currentUser?.email}");
                  } else {
                    return Splashscreen();
                  }
                } catch (e) {
                  print("Streambuilder error $e");
                  throw Exception(e);
                }
              })
              ),
    );
  }
}



// class ExampleCustomPagination extends StatelessWidget {
//   const ExampleCustomPagination({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Custom Pagination'),
//         ),
//         body: Column(
//           children: <Widget>[
//             SizedBox(
//               height: AppHeight(context, 0.45),
//               child: Swiper(
//                 itemBuilder: (context, index) {
//                   return Image.network(
//                     all[index],
//                     fit: BoxFit.fill,
//                   );
//                 },
//                 autoplay: true,
//                 itemCount: all.length,
//                 pagination: SwiperPagination(
//                     margin: EdgeInsets.zero,
//                     builder: SwiperPagination.dots
                    
//                     // SwiperCustomPagination(builder: (context, config) {
//                     //   return ConstrainedBox(
//                     //     child: Container(
//                     //       color: Colors.white,
//                     //       child: Text(
//                     //         '${[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
//                     //         style: const TextStyle(fontSize: 20.0),
//                     //       ),
//                     //     ),
//                     //     constraints: const BoxConstraints.expand(height: 50.0),
//                     //   );
//                     // })
                    
//                     ),
//                 control: const SwiperControl(),
//               ),
//             ),
//             // Expanded(
//             //   child: Swiper(
//             //     itemBuilder: (context, index) {
//             //       return Image.asset(
//             //         all[index],
//             //         fit: BoxFit.fill,
//             //       );
//             //     },
//             //     autoplay: true,
//             //     itemCount: all.length,
//             //     pagination: SwiperPagination(
//             //         margin: EdgeInsets.zero,
//             //         builder: SwiperCustomPagination(builder: (context, config) {
//             //           return ConstrainedBox(
//             //             child: Row(
//             //               children: <Widget>[
//             //                 Text(
//             //                   '${[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
//             //                   style: const TextStyle(fontSize: 20.0),
//             //                 ),
//             //                 Expanded(
//             //                   child: Align(
//             //                     alignment: Alignment.centerRight,
//             //                     child: const DotSwiperPaginationBuilder(
//             //                             color: Colors.black12,
//             //                             activeColor: Colors.black,
//             //                             size: 10.0,
//             //                             activeSize: 20.0)
//             //                         .build(context, config),
//             //                   ),
//             //                 )
//             //               ],
//             //             ),
//             //             constraints: const BoxConstraints.expand(height: 50.0),
//             //           );
//             //         })),
//             //     control: const SwiperControl(color: Colors.redAccent),
//             //   ),
//             // )
//           ],
//         ));
//   }
// }
