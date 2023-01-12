import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:quiz_app/Custom/colors.dart';
import 'package:quiz_app/Custom/custom_card_container.dart';
import 'package:quiz_app/NavDrawer.dart';
import 'package:quiz_app/Subject_Lists/Subject_List.dart';
import 'package:quiz_app/button.dart';

import '../LogIn.dart';
import '../admin_pages/classes.dart';
import 'QuizPage.dart';
import 'subject_list_3.dart';
import '../Custom/custom_app_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Palette.shade1,
      extendBodyBehindAppBar: true,
      //appbar
      appBar: AppBar(
        backgroundColor: Palette.shade9,
        centerTitle: true,
        // toolbarHeight: 80,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Padding(
          padding: EdgeInsets.only(right: 11, bottom: 14),
          child: IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
            icon: Icon(Icons.home_rounded,size: 38,),
          ),
          ),

        ),


        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(12, 230, 10, 12),
          child: Card(
            color: Palette.shade2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardContainer(
                    listTileTitle: 'class 9',
                    height: 60,
                    width: 140,
                    goto: Subject_List(),
                  ),
                  CustomCardContainer(
                    listTileTitle: 'class 10',
                    height: 60,
                    width: 140,
                    goto: Subject_List(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardContainer(
                    listTileTitle: 'class 9',
                    height: 60,
                    width: 140,
                    goto: Subject_List(),
                  ),
                  CustomCardContainer(
                    listTileTitle: 'class 10',
                    height: 60,
                    width: 140,
                    goto: Subject_List(),
                  ),
                ],
              ),
            ]),
          ),
        ),

      );



      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('classes').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       print('something went wrong');
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     }
      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) {
      //         var documentSnapshot = snapshot.data?.docs;
      //         return Padding(
      //           padding: EdgeInsets.all(30),
      //           child: Container(
      //             child: Column(
      //               children: [
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 GroupButton(
      //                     options: GroupButtonOptions(
      //                       textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //                       direction: Axis.vertical,
      //                       borderRadius: BorderRadius.circular(9),
      //                       elevation: 1,
      //                       buttonWidth: 230,
      //                       selectedTextStyle: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16,
      //                         color: Colors.black,
      //                       ),
      //                       unselectedTextStyle: const TextStyle(
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 14,
      //                         color: Colors.black,
      //                       ),
      //                       selectedColor: Palette.honey_yellow,
      //                       // unselectedColor: Colors.grey[300],
      //                       selectedBorderColor: Palette.shade7,
      //                       unselectedBorderColor: Colors.grey[500],
      //                     ),
      //
      //                     buttons: [
      //                       '${documentSnapshot![index]['ClassName']}',
      //                     ]  ,
      //                     onSelected: (value, index, isSelected) {
      //
      //                       // Navigator.pushReplacementNamed(context, "value");
      //                         },
      //                 ),
      //
      //                 // ElevatedButton(
      //                 //   onPressed: () {
      //                 //     Navigator.push(
      //                 //         context,
      //                 //         MaterialPageRoute(
      //                 //           builder: (context) => English(),
      //                 //         ));
      //                 //   },
      //                 //   child:
      //                 //       Text('${documentSnapshot![index]['ClassName']}'),
      //                 // ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // )

  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => classes()));
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => classes(),),
                (route) => false);
        break;
    }
  }
}


