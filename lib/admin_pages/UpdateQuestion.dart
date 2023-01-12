import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/admin_pages/subjects.dart';
import '../Custom/colors.dart';
import 'ListQuestionPage.dart';
import '../Custom/TextField.dart';

class UpdateQuestion extends StatefulWidget {
  UpdateQuestion({
    Key? key,
    required this.id,
    required this.subjectName,
    required this.className,
  }) : super(key: key);
  final String id;
   String subjectName;
   String className;


  @override
  State<UpdateQuestion> createState() => _UpdateQuestionState();
}

class _UpdateQuestionState extends State<UpdateQuestion> {
  String? subject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      subject='';
      // subject = widget.clsName;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final quesController = TextEditingController();
  final w_ans1Controller = TextEditingController();
  final w_ans2Controller = TextEditingController();
  final w_ans3Controller = TextEditingController();
  final c_ansController = TextEditingController();

  Future<void> updateUser(ques, w_ans1, w_ans2, w_ans3, c_ans,) async {

    if (subject == widget.subjectName) {
      await FirebaseFirestore.instance.collection(widget.subjectName).doc(widget.id).
      update({'ques': ques, 'w_ans1': w_ans1, 'w_ans2': w_ans2, 'w_ans3': w_ans3, 'c_ans': c_ans,})
          .then((value) => print("User Updated to same class"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      await FirebaseFirestore.instance.collection(widget.subjectName).doc(widget.id).delete().then((value) =>
          print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
      await FirebaseFirestore.instance.collection(subject!).doc(widget.id)
          .set({'ques': ques, 'w_ans1': w_ans1, 'w_ans2': w_ans2, 'w_ans3': w_ans3,   'c_ans': c_ans,
          })
          .then((value) => print("User Updated to another class"))
          .catchError((error) => print("Failed to update user: $error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:14.0),
          child: Text(
            'Update Questions',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Katibeh',
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Palette.darkblue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (() => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListQuestionPage(
                        subjectName: '${widget.subjectName}', className: '${widget.subjectName}',
                      ),
                    )),
              }),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Form(
                key: _formKey,
                // Getting Specific Data by ID
                child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: getDataByID(widget.id, widget.subjectName),
                  builder: (_, snapshot) {
                    print(snapshot.data?.id);
                    if (snapshot.hasError) {
                      return Text("Something Went Wrong");
                      print('Something Went Wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data != null) {
                      var data = snapshot.data!.data();

                      quesController.text = data!['ques'];
                      w_ans1Controller.text = data['w_ans1'];
                      w_ans2Controller.text = data['w_ans2'];
                      w_ans3Controller.text = data['w_ans3'];
                      c_ansController.text = data['c_ans'];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Palette.skyblue),

                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CTextField(
                                  label: 'Question',
                                  quesController: quesController),
                              CTextField(
                                  label: 'Wrong Answer',
                                  quesController: w_ans1Controller),
                              CTextField(
                                  label: 'Wrong Answer',
                                  quesController: w_ans2Controller),
                              CTextField(
                                  label: 'Wrong Answer',
                                  quesController: w_ans3Controller),
                              CTextField(
                                  label: 'Correct Answer',
                                  quesController: c_ansController),
                              SizedBox(
                                height: 17,
                              ),

                              //eng
                              RadioListTile(
                                value: "${widget.className}-eng",
                                groupValue: subject,
                                title: const Text("English"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(() {
                                       subject = value.toString();
                                      print('subject value ${subject}');
                                    },
                                  );
                                },
                              ),
                              //math
                              RadioListTile(
                                value: "${widget.className}-math",
                                groupValue: subject,
                                title: const Text("Mathematics"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();
                                      print('subject ${subject}');

                                        },
                                  );
                                },
                              ),
                              //bio
                              RadioListTile(
                                value: "${widget.className}-bio",
                                groupValue: subject,
                                title: const Text("Biology"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();

                                        },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //computer
                              RadioListTile(
                                value: "${widget.className}-computer",
                                groupValue: subject,
                                title: const Text("Computer"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();

                                        },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //urdu
                              RadioListTile(
                                value: "${widget.className}-urdu",
                                groupValue: subject,
                                title: const Text("Urdu"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();

                                        },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //physics
                              RadioListTile(
                                value: "${widget.className}-phy",
                                groupValue: subject,
                                title: const Text("Physics"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(() {
                                      subject = value.toString();
                                      },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //chemistry
                              RadioListTile(
                                value: "${widget.className}-chemistry",
                                groupValue: subject,
                                title: const Text("Chemistry"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();

                                        },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //islamiat
                              RadioListTile(
                                value: "${widget.className}-islamiat",
                                groupValue: subject,
                                title: const Text("Islamiat"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(
                                        () {
                                      subject = value.toString();

                                        },
                                  );
                                },
                                // toggleable: true,
                              ),
                              //pak-studies
                              RadioListTile(
                                value: "${widget.className}-pks",
                                groupValue: subject,
                                title: const Text("Pak-Studies"),
                                onChanged: (value) {
                                  print("Current User ${value}");
                                  setState(() {
                                      subject = value.toString();
                                        },
                                  );
                                },
                                // toggleable: true,
                              ),


                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        print("subject from radio ${subject}");
                                        // Validate returns true if the form is valid, otherwise false.
                                        if (_formKey.currentState!.validate()) {
                                          updateUser(
                                            quesController.text,
                                            w_ans1Controller.text,
                                            w_ans2Controller.text,
                                            w_ans3Controller.text,
                                            c_ansController.text,
                                          );

                                          _showToast(context,'user updated!');
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text(
                                        'Update',
                                        style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                          wordSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // ),
                        ),
                      );
                    } else {
                      return Text("data");
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  getDataByID(String userid, String clsName) {
    print(userid);
    try {
      return FirebaseFirestore.instance.collection(clsName).doc(userid).get();
    } catch (e) {
      print(e);
    }
  }

  void _showToast(BuildContext context,title) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Text(title,
                    style: TextStyle(fontSize: 18,fontFamily: 'Comfortaa')),
              ),
            ],
          ),

      ),
    );
  }

  void update() {
    if (_formKey.currentState!.validate()) {
      updateUser(
        quesController.text,
        w_ans1Controller.text,
        w_ans2Controller.text,
        w_ans3Controller.text,
        c_ansController.text,
      );

      // _showToast(context,'user updated!');
      Navigator.pop(context);
    }
  }

}
