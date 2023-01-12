import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/Custom/colors.dart';

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
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.shade9,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // TextFormField(
                  //   validator: validateEmail,
                  //   cursorHeight: 17,
                  //   cursorWidth: 4.8,
                  //   cursorColor: Colors.white,
                  //   cursorRadius: Radius.elliptical(60, 30),
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w800,
                  //       wordSpacing: 0.5),
                  //   controller: email,
                  //   keyboardType: TextInputType.name,
                  //   decoration: const InputDecoration(
                  //     icon: Icon(Icons.email_rounded),
                  //     labelText: " email",
                  //     labelStyle: TextStyle(
                  //         fontSize: 16.0,
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.white),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white70, width: 1.8),
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Color.fromRGBO(244, 175, 27, 100), width: 1.8),
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //     ),
                  //   ),
                  // ),

                  // Email TextFieldForm
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
                        borderSide:
                            BorderSide(color: Palette.skyblue, width: 1.8),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  //PasswordTextFieldForm
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Palette.skyblue, width: 1.8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                  const SizedBox(height: 90),

                  //signup button
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text('Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Katibeh',
                              color: Palette.shade9,
                              fontSize: 36,
                              letterSpacing: 1
                          )),
                    ),
                    onPressed: () {
                      sign_up(email, password);

                    },
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 08),
                      primary: Palette.skyblue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 48, vertical: 0),

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
    );


  }


  String? validateEmail(String? formEmail) {
    RegExp regex = RegExp(r'\w+@\w+\.\w+');
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required.';
    }
    if (!formEmail.contains('@gmail.com')) {
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
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required.';
    }
    if (!regex.hasMatch(formPassword)) {
      return ' 6 charcters long including uppercase, digits and sepcial character';

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
          // errorMessage = "${user.user?.email}";
          _showToast(context,'signed up successfully!');
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _showToast(context,'email you entered is already registered!');
            // errorMessage = "Email you entered is already registered.";
          });
        }
      } catch (e) {
        setState(() {
          errorMessage = "$e";
        });
      }
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  void _showToast(BuildContext context, String title) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
       SnackBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 18,fontFamily: 'Comfortaa')),
          ],
        ),
      ),
    );
  }
}
