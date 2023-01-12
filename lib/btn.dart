import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
class btn_class extends StatefulWidget {
  const btn_class({Key? key}) : super(key: key);

  @override
  State<btn_class> createState() => _btn_classState();
}

class _btn_classState extends State<btn_class> {
  String d_v ="msg1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Center(
        child: GroupButton(
            buttons: ['1','2'],
            buttonBuilder: (selected, value, context) {
              return d_v==value?ElevatedButton(onPressed: (){
                print('$value');
                }, child: Text("$value")):
              ElevatedButton(onPressed: (){setState(() {
                d_v=value;
              });}, child: Text("$value"));
            },

    ),
      ),
    ]
    ),);
  }
}
