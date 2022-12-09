import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/ForgotPassword.dart';
import 'package:untitled7/SignUp.dart';
import 'package:untitled7/questions.dart';

class log_in extends StatefulWidget {
  log_in({
    Key? key,
    // required String title
  }) : super(key: key);

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = "";
  Color mainColor = Color(0xffFFaa00);
  bool _isHidden = true;
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
        backgroundColor: Color(0xff00113F),
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
                      decoration:  InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded,color:mainColor),
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
                      controller: password, obscureText: _isHidden,
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(


                            suffix: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon( Icons.visibility,color: mainColor,),
                            ),

                          prefixIcon: Icon(Icons.password_rounded,color:mainColor),
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: TextButton(
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(fontSize: 14, letterSpacing: 1.3),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => questions()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 70),
                    ElevatedButton(
                      child: Text('LOG IN'),
                      onPressed: () {
                        login(email, password);
                        Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          animationDuration: Duration(seconds: 08),
                          primary: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 52, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 74,
                          ),
                          Text(
                            "if you don't have account!",
                            style: TextStyle(fontSize: 12, color: Colors.white,letterSpacing: 2),
                          ),
                          TextButton(
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 14, letterSpacing: 1.3),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => sign_up()),
                              );
                            },
                          ),
                        ],
                      ),
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


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });

  }

  String? validateEmail(String? formEmail) {
    RegExp regex =
    RegExp(r'\w+@\w+\.\w+');
    if (formEmail == null || formEmail.isEmpty)
    {
      return 'E-mail address is required.';
    }
      if (!regex.hasMatch(formEmail)) {
        return 'Enter valid Email';
      } else {

        return null;
      }

  }
  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      {
        return 'Password is required.';
      } else {
    return null;
  }

  }
  Future<void> login(
      TextEditingController email, TextEditingController password) async {
    if (_formKey.currentState!.validate()) {
      try {

      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      // print("user Login ${user.user?.email}");
      setState(() {
        errorMessage = "${user.user?.email}";
      });
      // errorMessage='';
    } on FirebaseAuthException catch (e) {

       if (e.code=='wrong-password') {

           setState(() {
             errorMessage = "Wrong password.";
           });
         }
       else {if (e.code == 'has-email') {
         setState(() {
           errorMessage = "Wrong credentials.";
         });
       }}

    } catch (e) {
    setState(() {
        errorMessage = "$e";
      });
    }
    }
  }
}
