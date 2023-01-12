import 'package:flutter/material.dart';
import 'package:quiz_app/Custom/colors.dart';
import 'package:quiz_app/Subject_Lists/QuizPage.dart';
import '../Subject_Lists/HomePage.dart';
import '../admin_pages/classes.dart';

class CustomCardContainer extends StatelessWidget {
   const CustomCardContainer(
      {Key? key,
      required this.listTileTitle,
      this.listTileSubtitle,
      this.width,
      this.height,
      this.left,
      this.top,
      this.right,
      this.bottom,
      this.goto})
      : super(key: key);

  final String listTileTitle;
  final String? listTileSubtitle;
  final double? width, height, left, top, right, bottom;
  final Widget? goto;
  final String subtitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.fromLTRB(left ?? 6, top ?? 6, right ?? 6, bottom ?? 6),
            width: width ?? 200,   height: height ?? 110,

        child: Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),),
            color: Palette.honey_yellow,
          child: Center(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => goto??  classes(), //goto is a widget
                    ));
              },
              title: Center(
                child: Text(listTileTitle,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff023047))),
              ),
              subtitle: listTileSubtitle == null
                  ? Text(subtitle)
                  : Text(listTileSubtitle!,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xff023047))),
            ),
          ),
        ),

    );
  }
}
