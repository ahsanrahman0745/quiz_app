import 'dart:math';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../Custom/colors.dart';
import '../finishPage.dart';
import '../timer.dart';
import 'package:chips_choice/chips_choice.dart';
class QuizPage extends StatefulWidget {
  QuizPage({
    Key? key,
    required this.classNumber,
  }) : super(key: key);
  String classNumber;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  int score = 0;
 String btnString="";
  final _controller = GroupButtonController();
  CountDownController _Tcontroller = CountDownController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar
      // appBar: AppBar(
      //   scrolledUnderElevation: 9,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //   centerTitle: true,
      //   toolbarHeight: 137,
      //   backgroundColor: Palette.white,
      //   title:
      //   CircularCountDownTimer(
      //         width: MediaQuery.of(context).size.width / 4,
      //         height: MediaQuery.of(context).size.height /4,
      //         fillColor: Palette.honey_yellow.withOpacity(0.6),
      //         controller: _Tcontroller,
      //         backgroundColor: Palette.darkblue,
      //         strokeWidth: 4.0,
      //         strokeCap: StrokeCap.butt,
      //         isTimerTextShown: true,
      //         isReverse: true,
      //         onComplete: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => finishPage(score: '$score',),
      //               ));
      //         },
      //         textStyle: TextStyle(fontSize: 34.0, color: Colors.white),
      //         ringColor: Colors.white,
      //         duration: 10,
      //       ),
      //   automaticallyImplyLeading: false,
      //   shadowColor: Palette.honey_yellow,
      // ),
            body:Stack(children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance .collection(widget.classNumber).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('Something went Wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator());
                  }
                  //listview builder
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      var documentSnapshot = snapshot.data?.docs;

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              //Main card
                              Card(
                                // color: Palette.skyblue,
                                // color: Palette.honey_yellow.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Column(children: [

                                    // Question index Card

                                    // Card(
                                    //   shape: RoundedRectangleBorder(
                                    //     borderRadius: BorderRadius.circular(10.0),
                                    //   ),
                                    //   color: Palette.shade9,
                                    //   child: Center(
                                    //     child: Padding(
                                    //       padding:
                                    //       const EdgeInsets.fromLTRB(0, 13, 0, 0),
                                    //       child: Text(
                                    //           ' Question ${index + 1}/${documentSnapshot?.length} ',
                                    //           style: const TextStyle(
                                    //             fontSize: 38,
                                    //             fontFamily: 'Katibeh',
                                    //             fontWeight: FontWeight.w600,
                                    //             color: Colors.white,
                                    //             wordSpacing: 2,
                                    //           )),
                                    //     ),
                                    //   ),
                                    // ),

                                    // Question
                                    Padding(
                                      padding:
                                       EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Text(
                                          ' Question ${index + 1}/${documentSnapshot?.length} ',
                                          style:  TextStyle(
                                            fontSize: 28,
                                            fontFamily: 'Katibeh',
                                            fontWeight: FontWeight.w600,
                                            color: Palette.shade9,
                                            wordSpacing: 2,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                        child: Text(
                                            '${documentSnapshot![index]['ques']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Comfortaa',
                                                fontWeight: FontWeight.w600,
                                                color: Palette.shade9)),
                                      ),
                                    ),
                                    // buttons

                                    Container(
                                      alignment: FractionalOffset(0, 0),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: GroupButton<String>(
                                          controller: _controller,
                                          options: GroupButtonOptions(
                                            textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                            direction: Axis.vertical,
                                            borderRadius: BorderRadius.circular(9),
                                            // elevation: 1,
                                            buttonWidth: 230,
                                            alignment: Alignment.centerLeft,
                                            selectedTextStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Palette.shade9,
                                            ),
                                            unselectedTextStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Palette.shade9,
                                            ),
                                            selectedColor: Palette.honey_yellow,
                                            selectedBorderColor: Palette.shade5,
                                            unselectedBorderColor: Colors.grey[500],
                                          ),

                                          buttons: [
                                            "${documentSnapshot[index]['w_ans1']}",
                                            "${documentSnapshot[index]['w_ans2']}",
                                            "${documentSnapshot[index]['w_ans3']}",
                                            "${documentSnapshot[index]['c_ans']}",
                                          ],
                                          isRadio: true,
                                          enableDeselect: false,



                                          buttonBuilder: (selected, value,context) {
                                            return btnString==value ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Palette.honey_yellowO,),
                                              onPressed: (){
                                                selected=true;
                                                print(value);
                                                print('$selected');
                                              }, child: Text(value,style: TextStyle(color:Palette.shade9, )),)
                                                :
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,),
                                                onPressed: (){
                                                  setState(() {
                                                    btnString = value;
                                                    if(btnString=="${documentSnapshot[index]['c_ans']}")
                                                    {
                                                      score++;
                                                    }
                                                  });
                                                  print(value);

                                                }, child: Text(value));


                                          },
                                        ),
                                      ),
                                    ),
                                    Text('$score'),














                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0,top: 12),
                child: Container(
                  alignment: Alignment.topRight,
                  child: CircularCountDownTimer(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height /6,
                    fillColor: Palette.honey_yellow.withOpacity(0.6),
                    controller: _Tcontroller,
                    backgroundColor: Colors.transparent,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    isTimerTextShown: true,
                    isReverse: true,
                    onComplete: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => finishPage(score: '$score',),
                          ));
                    },
                    textStyle: TextStyle(fontSize: 32.0, color: Palette.shade9),
                    ringColor: Colors.white,
                    duration: 50,
                  ),
                ),
              ),
                  ],),


      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance  .collection(widget.classNumber)  .snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       print('Something went Wrong');
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: CircularProgressIndicator());
      //     }
      //     //listview builder
      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) {
      //         var random = new Random();
      //         var documentSnapshot = snapshot.data?.docs;
      //
      //         return Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: 10,
      //           ),
      //           child: Container(
      //             child: Column(
      //               children: [
      //                  SizedBox(height: 10,),
      //                 //Main card
      //                 Card(
      //                   // color: Palette.skyblue,
      //                   // color: Palette.honey_yellow.withOpacity(0.2),
      //                   shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(14.0),
      //                   ),
      //                   child: Padding(
      //                     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //                     child: Column(children: [
      //
      //                       // Question index Card
      //                       Card(
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(10.0),
      //                         ),
      //                         color: Palette.shade9,
      //                         child: Center(
      //                           child: Padding(
      //                             padding:
      //                                 const EdgeInsets.fromLTRB(0, 13, 0, 0),
      //                             child: Text(
      //                                 ' Question ${index + 1}/${documentSnapshot?.length} ',
      //                                 style: const TextStyle(
      //                                   fontSize: 38,
      //                                   fontFamily: 'Katibeh',
      //                                   fontWeight: FontWeight.w600,
      //                                   color: Colors.white,
      //                                   wordSpacing: 2,
      //                                 )),
      //                           ),
      //                         ),
      //                       ),
      //
      //                       // Question
      //                       SizedBox(
      //                         width: 400,
      //                         child: Padding(
      //                           padding:
      //                               const EdgeInsets.fromLTRB(10, 12, 10, 20),
      //                           child: Text(
      //                               '${documentSnapshot![index]['ques']}',
      //                               style: TextStyle(
      //                                   fontSize: 21,
      //                                   fontFamily: 'Comfortaa',
      //                                   fontWeight: FontWeight.w600,
      //                                   color: Palette.shade9)),
      //                         ),
      //                       ),
      //                      // buttons
      //
      //                     Container(
      //                          alignment: FractionalOffset(0, 0),
      //                          child: Padding(
      //                            padding: EdgeInsets.symmetric(horizontal: 10),
      //                            child: GroupButton<String>(
      //                              controller: _controller,
      //                              options: GroupButtonOptions(
      //                                textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      //                                direction: Axis.vertical,
      //                                borderRadius: BorderRadius.circular(9),
      //                                // elevation: 1,
      //                                buttonWidth: 230,
      //                                alignment: Alignment.centerLeft,
      //                                selectedTextStyle: TextStyle(
      //                                  fontWeight: FontWeight.bold,
      //                                  fontSize: 16,
      //                                  color: Palette.shade9,
      //                                ),
      //                                unselectedTextStyle: TextStyle(
      //                                  fontWeight: FontWeight.w600,
      //                                  fontSize: 15,
      //                                  color: Palette.shade9,
      //                                ),
      //                                selectedColor: Palette.honey_yellow,
      //                                selectedBorderColor: Palette.shade5,
      //                                unselectedBorderColor: Colors.grey[500],
      //                              ),
      //
      //                              buttons: [
      //                                "${documentSnapshot[index]['w_ans1']}",
      //                                "${documentSnapshot[index]['w_ans2']}",
      //                                "${documentSnapshot[index]['w_ans3']}",
      //                                "${documentSnapshot[index]['c_ans']}",
      //                              ],
      //                              isRadio: true,
      //                              enableDeselect: false,
      //
      //
      //
      //                              buttonBuilder: (selected, value,context) {
      //                                return btnString==value ? ElevatedButton(
      //                                  style: ElevatedButton.styleFrom(backgroundColor: Palette.honey_yellowO,),
      //                                    onPressed: (){
      //                                    selected=true;
      //                                       print(value);
      //                                       print('$selected');
      //                                    }, child: Text(value,style: TextStyle(color:Palette.shade9, )),)
      //                                    :
      //                                ElevatedButton(
      //                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,),
      //                                    onPressed: (){
      //                                      setState(() {
      //                                        btnString = value;
      //                                        if(btnString=="${documentSnapshot[index]['c_ans']}")
      //                                        {
      //                                               score++;
      //                                        }
      //                                         });
      //                                      print(value);
      //
      //                                    }, child: Text(value));
      //
      //
      //                              },
      //                            ),
      //                          ),
      //                        ),
      //                       Text('$score'),
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //
      //                     ]),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }

}

