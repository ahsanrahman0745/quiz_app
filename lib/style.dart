import 'package:flutter/material.dart';

class text_form_field extends StatefulWidget {
  text_form_field({Key? key}) : super(key: key);
final icon=Icon;
  @override
  State<text_form_field> createState() => _text_form_fieldState();
}

class _text_form_fieldState extends State<text_form_field> {
  Color mainColor = Color(0xffFFaa00);
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 360, 6, 8),
      // height: 300,width: 300,
      // color: Colors.blue,
      // child: SizedBox( height: 300,width: 200,
      child: Card(
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side: BorderSide(width: 3, color: Colors.pink)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded, color: mainColor),
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
            ],
          )),
      // ),
    );
    //
  }
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
