import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/Subject_Lists/HomePage.dart';
import 'package:quiz_app/btn.dart';
import 'package:quiz_app/new-page.dart';
import 'package:quiz_app/rive.dart';
import 'package:quiz_app/timer.dart';
import 'NavDrawer.dart';
import 'Subject_Lists/QuizPage.dart';
import 'admin_pages/classes.dart';
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
      theme: ThemeData(  fontFamily:'Comfortaa dsd dsf ' ,textTheme: TextTheme(),

    primarySwatch:Colors.indigo
      ),
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
