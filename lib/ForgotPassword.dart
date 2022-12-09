import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/SignUp.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController email = TextEditingController();
  TextEditingController new_password = TextEditingController();
  TextEditingController current_password = TextEditingController();
  String data = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:
        TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // backgroundColor: HexColor(	'#00154f'),
        backgroundColor:
        Color.fromRGBO(0, 21, 79, 100),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 420, 30, 0),
            child: Column(children: [
              TextFormField(
                cursorHeight: 17,
                cursorWidth: 4.8,
                cursorColor: Colors.white30,
                cursorRadius: Radius.elliptical(60, 30),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    wordSpacing: 0.5),
                controller: current_password,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: " current password",
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.8),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(244, 175, 27, 100),
                            width: 1.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorHeight: 17,
                cursorWidth: 4.8,
                cursorColor: Colors.white30,
                cursorRadius: Radius.elliptical(60, 30),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    wordSpacing: 0.5),
                controller: email,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: " email",
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.8),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(244, 175, 27, 100),
                            width: 1.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorHeight: 17,
                cursorWidth: 4.8,
                cursorColor: Colors.white30,
                cursorRadius: Radius.elliptical(60, 30),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    wordSpacing: 0.5),
                controller: new_password,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: " new password",
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70, width: 1.8),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(244, 175, 27, 100),
                            width: 1.8),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
              SizedBox(height: 0.8),
              Text(data),
              SizedBox(height: 68),


              ElevatedButton(
                child: Text('Reset Password'),
                onPressed: () {
                  reset_password(email, current_password,new_password);
                },
                style: ElevatedButton.styleFrom(
                    animationDuration: Duration(seconds: 08),
                    primary: Color.fromRGBO(244, 175, 27, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 52, vertical: 0),
                    textStyle: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w900)),
              ),
            ]),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  void reset_password(TextEditingController email, TextEditingController current_password, TextEditingController new_password) {
    final user=FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }
}
