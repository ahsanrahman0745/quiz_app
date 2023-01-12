import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/admin_pages/subjects.dart';
import '../Custom/AppBar.dart';
import '../Custom/colors.dart';
import '../Subject_Lists/HomePage.dart';
import 'AddQuestion.dart';
import 'UpdateQuestion.dart';
import 'classes.dart';

class ListQuestionPage extends StatefulWidget {
  ListQuestionPage({
    Key? key,
    required this.subjectName,
    required this.className,
  }) : super(key: key);
  String subjectName;
  String className;

  @override
  State<ListQuestionPage> createState() => _ListQuestionPageState();
}

class _ListQuestionPageState extends State<ListQuestionPage> {
  var id = '';

  deleteUser(String id) async {
    // print("User Deleted $id");
    await FirebaseFirestore.instance
        .collection(widget.subjectName)
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              print('subject name:  ${widget.subjectName}');
              print('class name:  ${widget.className}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddQuestion(subjectName: '${widget.subjectName}', className: '${widget.className}',),
                ),
              );
            },
            child: Text(
              'Add ', style: TextStyle(
                color: Palette.honey_yellow, fontSize: 30, wordSpacing: 2, fontWeight: FontWeight.bold,),
            ),
          ),
        ],
        backgroundColor: Palette.darkblue,
        elevation: 6,
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            'Questions',
            style: TextStyle(
                color: Colors.white,
                fontSize: 54,
                fontFamily: 'Katibeh',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => subjects(className: '${widget.subjectName}'),)
            );
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(widget.subjectName).snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              print('Something went Wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var documentSnapshot = snapshot.data?.docs;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/bg.jpg'),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 8,),

                       //Question Index No's
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          color: Palette.honey_yellow,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                                ' Question ${index + 1}/${documentSnapshot?.length} ',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.darkblue,
                                )),
                          ),
                        ),

                        const SizedBox(height: 10,),

                        Card(
                          color: Palette.skyblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 13, 10, 10),
                            child: Column(children: [

                              //Question Here
                              Row(
                                children: [
                                  Text(
                                    'Q:',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.darkblue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 400,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 22, vertical: 10),
                                        child: Text(
                                            '${documentSnapshot![index]['ques']}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Palette.darkblue)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //False Option 1
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ':F',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.darkblue,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              '${documentSnapshot[index]['w_ans1']}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Palette.darkblue)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //False Option 2
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ':F',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.darkblue,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              '${documentSnapshot[index]['w_ans2']}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Palette.darkblue)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //False Option 3
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ':F',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.darkblue,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              '${documentSnapshot[index]['w_ans3']}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Palette.darkblue)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //True Option
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ':T',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.darkblue,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 300,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        color: Colors.green,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              '${documentSnapshot[index]['c_ans']}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                child: Row(
                                  children: [

                                    const SizedBox(width: 280,),

                                  //  Edit Button
                                    SizedBox(width: 50,height: 50,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.blue,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateQuestion(
                                                    id: documentSnapshot[index].id, subjectName: widget.subjectName,
                                                        className: widget.className,
                                                        // className:"${widget.classNumber}"
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit, color: Colors.white,size: 20,
                                            )),
                                      ),
                                    ),

                                    const SizedBox(width: 5,),

                                    //Delete Button
                                    SizedBox(
                                      width: 50,height: 50,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.redAccent,
                                        child: IconButton(
                                          onPressed: () {
                                            deleteUser(documentSnapshot[index].id);
                                            _showToast(context,'Question Deleted!');
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
void _showToast(BuildContext context,title) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18,fontFamily: 'Comfortaa')),
        ],
      ),
    ),
  );
}
