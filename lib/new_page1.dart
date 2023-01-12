import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Custom/colors.dart';
import 'admin_pages/classes.dart';
class new_page1 extends StatefulWidget {
  const new_page1({Key? key}) : super(key: key);

  @override
  State<new_page1> createState() => _new_page1State();
}

class _new_page1State extends State<new_page1> {

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  String errorMessage = "";

  bool _isHidden = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
return

   Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 180),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.all(Radius.circular(40)
          )
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14, vertical: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Text('sign up',
                          style: TextStyle(color: Palette.darkblue,
                            fontSize: 42, fontWeight: FontWeight.bold,)),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text('signin to continue to app with'
                            ' different quizes and evaluate '
                            'yourself new interesting concepts',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16,)),
                      ),
                      SizedBox(height: 80,),
                      // Email TextFormField
                      TextFormField(
                        validator: validateEmail,
                        cursorHeight: 17,
                        cursorWidth: 4.8,
                        cursorColor: Colors.black,
                        cursorRadius: Radius.elliptical(60, 30),
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            wordSpacing: 0.5),
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: () {

                            },
                            // _togglePasswordView,
                            child: Icon(
                              Icons.visibility,
                              color: Colors.transparent,
                            ),
                          ),
                          prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Palette.honey_yellowO),
                          labelText: " email",
                          labelStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Palette.shade9
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black26, width: 1.8),
                            borderRadius: BorderRadius.all(
                                Radius.circular(28.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black38, width: 1.8),
                            borderRadius: BorderRadius.all(
                                Radius.circular(28.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      //   Password TextFormField
                      TextFormField(
                        validator: validatePassword,
                        cursorHeight: 17,
                        cursorWidth: 4.8,
                        cursorColor: Colors.black,
                        cursorRadius: Radius.elliptical(60, 30),
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            wordSpacing: 0.5),
                        controller: password,
                        obscureText: _isHidden,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                  print('$_isHidden');
                                });
                              },
                              // _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                color: Palette.honey_yellowO,
                              ),
                            ),
                            prefixIcon: Icon(Icons.password_rounded,
                                color: Palette.honey_yellowO),
                            labelText: " password",
                            labelStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Palette.shade9),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black26, width: 1.8),
                              borderRadius:
                              BorderRadius.all(Radius.circular(28.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 1.8),
                                borderRadius:
                                BorderRadius.all(Radius.circular(28.0)))),
                      ),

                      //ForgotPassword
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 0.8,
                                  color: Colors.black),
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
                      const SizedBox(height: 120),
                      //login button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(seconds: 08),
                          primary: Palette.honey_yellowO,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(28)),
                          ),
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8),
                        ),
                        onPressed: () {
                          login(email, password);
                          Text(
                            errorMessage,
                            style: TextStyle(color: Colors.red),
                          );
                        },
                        icon: Icon(Icons.navigate_next_outlined,
                            color: Palette.shade9, size: 30),
                        label: Text('sign in', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.shade9,
                            fontSize: 28,
                            letterSpacing: 0.8)),),
                      //signup button
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //dont hv acc
                            Text(" Don't have account!",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  letterSpacing: 1),
                            ),
                            //signup
                            TextButton(

                              child: Text('Sign up',
                                style: TextStyle(fontSize: 15,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => sign_up(),));
                                //  dialog();

                                Future.delayed(
                                    Duration(milliseconds: 400), () {
                                  // Navigator.pushReplacement(context,
                                  //     PageTransition(child: new_page1(), type: PageTransitionType.fade));

                                  showGeneralDialog(context: context,
                                    transitionBuilder: (context,
                                        animation, secondaryAnimation,
                                        child) {
                                      final tween = Tween(  begin: Offset(0.0, -1.0), end: Offset.zero);

                                      return SlideTransition(
                                        position: tween.animate(
                                            CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeInOut)),
                                        child: child,
                                      );
                                    },

                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                                    {
                                      return Container(

                                      ) ;},
                                  );

                                  // transitionBuilder: (context, animation, secondaryAnimation, child) {
                                  //   Tween<Offset>tween;
                                  //   tween=Tween(begin:Offset(0,-1),end: Offset.zero );
                                  //   return SlideTransition(position: tween.animate(
                                  //       CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
                                  //     child:child,
                                  //   );
                                  //
                                  // };


                                });
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

            // Text(errorMessage, style: const TextStyle(color: Colors.red),),

            Positioned(
                left: 0,
                right: 0,
                bottom: -20,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.black),
                ))
          ],

        ),


      ),

    ) ;


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

  void _showToast(BuildContext context, title) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontFamily: 'Comfortaa')),
          ],
        ),
      ),
    );
  }


  Future<void> login(TextEditingController email,
      TextEditingController password) async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        // Navigator.push(context, MaterialPageRoute(builder: HomePage(),));
        setState(() {
          // errorMessage = "${user.user?.email}";
          _showToast(context, 'login successfully!');
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: classes()));
        });

        // errorMessage='';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          setState(() {
            // errorMessage = "Wrong password.";
            _showToast(context, 'wrong password!');
          });
        } else {
          if (e.code != 'has-email') {
            setState(() {
              // errorMessage = "Wrong credentials.";
              _showToast(context, 'email not registered!');
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
