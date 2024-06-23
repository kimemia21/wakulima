import 'package:application/AppBloc.dart';
import 'package:application/authentication/LoginScreen.dart';
import 'package:application/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home:MultiProvider(
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
        providers: [
     ChangeNotifierProvider(create:(context)=> CurrentUserProvider())
      ])
      
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body:LoginScreen(),
      
   
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
