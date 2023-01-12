import 'package:flutter/material.dart';

import '../Custom/colors.dart';
import '../Custom/custom_app_bar.dart';
import '../Custom/custom_card_container.dart';
// import '../Questions/test_questions.dart';
class SubjectList_3 extends StatelessWidget {
  const SubjectList_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blue,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Test 1 SubjectList',
        // titleWidget: Icon(
        //   Icons.access_time,
        //   color: Colors.white,
        // ),
        // leading: Icon(Icons.home,color: Colors.white,),
        showActionIcon: true,
        onMenuActionTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubjectList_3(),
              ));
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(10, 230, 10, 10),
        child: Card(
          color: Colors.white24,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // CustomCardContainer(ListTileTitle: 'TestSubject1',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),
                // CustomCardContainer(ListTileTitle: 'TestSubject2',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),
                // CustomCardContainer(ListTileTitle: 'TestSubject3',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),
                // CustomCardContainer(ListTileTitle: 'TestSubject4',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),
                // CustomCardContainer(ListTileTitle: 'TestSubject5',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),
                // CustomCardContainer(ListTileTitle: 'TestSubject6',Width: 400,Height: 80, ListTileSubtitle: 'its test subtitle',goto: questions()),

              ]),
        ),
      ),
    );
  }
}
