import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/Subject_Lists/QuizPage.dart';
import 'package:quiz_app/admin_pages/classes.dart';
import '../Custom/colors.dart';
import '../Custom/custom_card_container.dart';
import 'ListQuestionPage.dart';

class subjects extends StatefulWidget {
   subjects({Key? key,  required this.className,}) : super(key: key);
    String className;

  @override
  State<subjects> createState() => _subjectsState();
}

class _subjectsState extends State<subjects> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Palette.blue,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Palette.darkblue,
        centerTitle: true,
        title: Text(
          "All Subjects",
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Katibeh',
              wordSpacing: 2),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => classes()
            ),);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Card(
            color: Palette.skyblue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0),),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),

                  //eng
                  CustomCardContainer(
                    listTileTitle: 'English',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                      subjectName: '${widget.className}-eng', className: '${widget.className}',
                    ),
                  ),
                  //math
                  CustomCardContainer(
                    listTileTitle: 'Mathematics',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                      subjectName: 'class9-math',className: '${widget.className}'
                    ),
                  ),
                  //bio
                  CustomCardContainer(
                    listTileTitle: 'Biology',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                      subjectName: 'class9-bio',
                        className: '${widget.className}'
                    ),
                  ),
                  //computer
                  CustomCardContainer(
                    listTileTitle: 'Computer',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                      subjectName: 'class9-computer',
                        className: '${widget.className}'
                    ),
                  ),
                  //urdu
                  CustomCardContainer(
                    listTileTitle: 'Urdu',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                        subjectName: 'class9-urdu',
                        className: '${widget.className}'
                    ),
                  ),
                  //phy
                  CustomCardContainer(
                    listTileTitle: 'Physics',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                        subjectName: 'class9-phy',
                        className: '${widget.className}'
                    ),
                  ),
                  //chemistry
                  CustomCardContainer(
                    listTileTitle: 'chemistry',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                        subjectName: 'class9-chemistry',
                        className: '${widget.className}'
                    ),
                  ),
                  //islamiat
                  CustomCardContainer(
                    listTileTitle: 'Islamiat',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                        subjectName: 'class9-islamiat',
                        className: '${widget.className}'
                    ),
                  ),
                  //Pak-studies
                  CustomCardContainer(
                    listTileTitle: 'Pak-Studies',
                    height: 80,
                    width: 260,
                    goto: ListQuestionPage(
                        subjectName: 'class9-computer',
                        className: '${widget.className}'
                    ),
                  ),

                     ]),
          ),
        ),
      ),
    );
  }
}
