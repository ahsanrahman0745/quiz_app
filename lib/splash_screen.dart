import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled7/LogIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => log_in(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: (const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFaa00),
                Color(0xff00113F),
              ]),
        )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SizedBox(height: 04),
              Image(
                image: AssetImage('images/Bulb-Learning-Transparent.png'),),
              CircularProgressIndicator(color: Colors.white),
              Text('Learn And \n Test Your Knowledge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: Colors.white)),
            ]),
      ),
    );
  }
}
