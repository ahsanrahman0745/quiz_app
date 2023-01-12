import 'package:flutter/material.dart';
class finishPage extends StatelessWidget {
   finishPage({Key? key,required this.score}) : super(key: key);
 String score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('$score'),);
  }
}
