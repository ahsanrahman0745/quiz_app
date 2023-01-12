import 'package:flutter/material.dart';

import 'colors.dart';
class CTextField extends StatelessWidget {
   CTextField({Key? key, this.label,this.quesController,this.onChange}) : super(key: key);

   final void Function(String)? onChange;
   final String? label;
   final TextEditingController? quesController;
  @override
  Widget build(BuildContext context) {
    return Container(

        width: 600,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            color: Colors.white,
            child:    TextFormField(
              controller: quesController,
              onChanged: onChange,
              autofocus: false,
              decoration: InputDecoration(
                labelText:  label,

                labelStyle: TextStyle(fontSize
                    : 22.0, color: Palette.darkblue,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14),),
                errorStyle:
                TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter something';
                }
                return null;
              },
            ),
          ),
        ),
      );
  }
}
