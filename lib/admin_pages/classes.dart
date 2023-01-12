import 'package:flutter/material.dart';
import 'package:quiz_app/Custom/colors.dart';
import 'package:quiz_app/Custom/custom_card_container.dart';
import 'package:quiz_app/admin_pages/subjects.dart';

import 'ListQuestionPage.dart';

class classes extends StatefulWidget {
  const classes({
    Key? key,
  }) : super(key: key);

  @override
  State<classes> createState() => _classesState();
}

class _classesState extends State<classes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.darkblue,
        title: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Text(
            "All Questions",
            style: TextStyle(
                fontFamily: 'Katibeh',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 48),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.logout_rounded,size: 32,)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Card(
              color: Palette.skyblue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0),),
              child: Column(
                  children: [
                    SizedBox(height: 10,),

                    Center(
                      child: Column(
                        children: [
                          CustomCardContainer(
                            listTileTitle: "Class 9",
                            height: 70,
                            width: 230,
                            goto: subjects(className: 'class9'),
                          ),
                          CustomCardContainer(
                            listTileTitle: "Class 10",
                            height: 70,
                            width: 230,
                            goto: subjects(className: 'class10'),
                          ),
                          CustomCardContainer(
                            listTileTitle: "Class 11",
                            height: 70,
                            width: 230,
                            goto: subjects(className: 'class11'),
                          ),
                        ],
                      ),
                    ),


                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
