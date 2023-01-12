import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/Custom/AppBar.dart';
import 'package:quiz_app/Subject_Lists/QuizPage.dart';

import '../Custom/colors.dart';
import '../Custom/custom_app_bar.dart';
import '../Custom/custom_card_container.dart';

class Subject_List extends StatelessWidget {
  const Subject_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.blue,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        backgroundColor: Palette.darkblue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: const Text(
            "Tests",
            style: TextStyle(
                fontFamily: 'katibeh',
                fontSize: 58,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                wordSpacing: 2),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child:

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              SizedBox(
                height: 20,
              ),

              //math
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-math.jpg')),
                    title: Text("Mathematics",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-math',
                              )));
                    }),
              ),
              //eng
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-eng.png')),
                    title: Text("English",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-eng',
                              )));
                    }),
              ),
              //bio
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-bio.jpg')),
                    title: Text("Biology",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-bio',
                              )));
                    }),
              ),
              //computer
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-cmp.jpg')),
                    title: Text("Computer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-computer',
                              )));
                    }),
              ),
              //urdu
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-urdu.jpeg')),
                    title: Text("Urdu",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-urdu',
                              )));
                    }),
              ),
              //physics
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-phy.jpg')),
                    title: Text("Physics",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-phy',
                              )));
                    }),
              ),
              //chemistry
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-ch.jpg')),
                    title: Text("Chemistry",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-chemistry',
                              )));
                    }),
              ),
              //islamiat
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-isl.png')),
                    title: Text("Islamiat",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-islamiat',
                              )));
                    }),
              ),
              //pak-studies
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.black12,
                    leading:
                        Image(image: AssetImage('images/cls9/cls9-pks.jpg')),
                    title: Text("Pak-Studies",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Palette.shade9,
                        )),
                    subtitle: Text(""),
                    // isThreeLine: true,
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 100),
                              alignment: Alignment.bottomCenter,
                              childCurrent: this,
                              child: QuizPage(
                                classNumber: 'class9-pks',
                              )));
                    }),
              ),
            ]),

      ),
    );
  }
}
