import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
   String errorMessage = "";
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //   theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   textTheme:
      //   TextTheme(
      //     headline1: TextStyle(color: Colors.white),
      //     headline2: TextStyle(color: Colors.white),
      //     bodyText2: TextStyle(color: Colors.white),
      //     subtitle1: TextStyle(color: Colors.white),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // backgroundColor: HexColor(	'#00154f'),
        backgroundColor: Color.fromRGBO(0, 21, 79, 100),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
            child: Column(children: [
              Image(image: AssetImage('images/QuizAppLogo.png')),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: validateEmail,
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
                        icon: Icon(Icons.email_rounded),
                        labelText: " email",
                        labelStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70, width: 1.8),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(244, 175, 27, 100), width: 1.8),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 6,),
                    TextFormField(
                      validator: validatePassword,
                      cursorHeight: 17,
                      cursorWidth: 4.8,
                      cursorColor: Colors.white30,
                      cursorRadius: Radius.elliptical(60, 30),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          wordSpacing: 0.5),
                      controller: password,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration( icon: Icon(Icons.password_rounded),
                          labelText: " password",
                          labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70, width: 1.8),
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(244, 175, 27, 100),
                                  width: 1.8),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                    ),

                    const SizedBox(
                        height: 70),
                    ElevatedButton(
                      child: Text('SIGN UP'),
                      onPressed: () {
                        sign_up(email, password);
                      },
                      style: ElevatedButton.styleFrom(
                          animationDuration: Duration(seconds: 08),
                          primary: Color.fromRGBO(244, 175, 27, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 52, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ),

                  ],
                ),
              ),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            ]),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    RegExp regex =
    RegExp(r'\w+@\w+\.\w+');
    if (formEmail == null || formEmail.isEmpty)
    {
      return 'E-mail address is required.';
    }  if (!formEmail.contains('@gmail.com'))
    {
      return 'Enter valid Email format';
    } else {
      if (!regex.hasMatch(formEmail)) {
        return 'Enter valid Email';
      } else {

        return null;
      }
    }
  }
  String? validatePassword(String? formPassword) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (formPassword == null || formPassword.isEmpty)
    {
      return 'Password is required.';
    }
      if (!regex.hasMatch(formPassword)) {
        return 'Password should contain upper case,digit ,a Special character and 6 character long';
      } else {

        return null;
      }

  }

  Future<void> sign_up(
      TextEditingController email, TextEditingController password) async {
    if (_formKey.currentState!.validate()) {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print("user signup ${user.user?.email}");
      setState(() {
        errorMessage = "${user.user?.email}";
      });
    } on FirebaseAuthException catch (e) {
      if(e.code=='email-already-in-use') {
        setState(() {
          errorMessage = "Email you entered is already registered.";
        });
      }

    } catch (e) {
      setState(() {
        errorMessage = "$e";
      });
    }}
  }
}
