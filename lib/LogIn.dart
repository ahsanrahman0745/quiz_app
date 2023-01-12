import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/Custom/colors.dart';
import 'package:quiz_app/ForgotPassword.dart';
import 'package:quiz_app/Subject_Lists/HomePage.dart';
import 'package:quiz_app/SignUp.dart';
import 'package:quiz_app/admin_pages/classes.dart';
// import 'package:untitled7/Questions/test_questions.dart';

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
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Palette.shade9,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
            child: Column(children: [
              Image(image: AssetImage('images/QuizAppLogo.png')),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[

                    // Email TextFormField
                    TextFormField(
                      validator: validateEmail,
                      cursorHeight: 17,
                      cursorWidth: 4.8,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.elliptical(60, 30),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          wordSpacing: 0.5),
                      controller: email,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded,
                            color: Palette.honey_yellow),
                        labelText: " email",
                        labelStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 1.8),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.skyblue, width: 1.8),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 11,),

                    //Password TextFormField
                    TextFormField(
                      validator: validatePassword,
                      cursorHeight: 17,
                      cursorWidth: 4.8,
                      cursorColor: Colors.white,
                      cursorRadius: Radius.elliptical(60, 30),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          wordSpacing: 0.5),
                      controller: password,
                      obscureText: _isHidden,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              Icons.visibility,
                              color: Palette.honey_yellow,
                            ),
                          ),
                          prefixIcon: Icon(Icons.password_rounded,
                              color: Palette.honey_yellow),
                          labelText: " password",
                          labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white70, width: 1.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.skyblue, width: 1.8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),

                    //ForgotPassword
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       // builder: (context) => questions()),
                            // );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),

                    //login button
                    ElevatedButton(
                      onPressed: () {
                        login(email, password);
                        Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          animationDuration: Duration(seconds: 08),
                          primary: Palette.skyblue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 48, vertical: 0),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Katibeh',
                                color: Palette.shade9,
                                fontSize: 36,
                                letterSpacing: 1)),
                      ),
                    ),

                    //signup button
                    Center(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Don't have account!",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                letterSpacing: 1),
                          ),
                          TextButton(

                            child: Text('Sign up',
                              style: TextStyle(fontSize: 15, letterSpacing: 1,color: Colors.white,fontWeight: FontWeight.bold),),
                            onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => sign_up(),));

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
                style: const TextStyle(color: Colors.red),
              ),
            ]),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      );

  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String? validateEmail(String? formEmail) {
    RegExp regex = RegExp(r'\w+@\w+\.\w+');
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required.';
    }
    if (!regex.hasMatch(formEmail)) {
      return 'Enter valid Email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required.';
    } else {
      return null;
    }
  }

  void _showToast(BuildContext context,title) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18,fontFamily: 'Comfortaa')),
          ],
        ),
      ),
    );
  }


  Future<void> login(
      TextEditingController email, TextEditingController password) async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        // Navigator.push(context, MaterialPageRoute(builder: HomePage(),));
        setState(() {
          // errorMessage = "${user.user?.email}";
          _showToast(context,'login successfully!');
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: classes()));
        });

        // errorMessage='';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          setState(() {
            // errorMessage = "Wrong password.";
            _showToast(context,'wrong password!');
          });
        } else {
          if (e.code != 'has-email') {
            setState(() {
              // errorMessage = "Wrong credentials.";
              _showToast(context,'email not registered!');

            });
          }
        }
      } catch (e) {
        setState(() {
          errorMessage = "$e";
        });
      }
    }
  }
}
