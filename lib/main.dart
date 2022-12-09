import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled7/LogIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled7/splash_screen.dart';
import 'package:untitled7/style.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
Color mainColor=Color(0xFF252c4a);
Color primaryColor= Color(0xFF117eeb);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
