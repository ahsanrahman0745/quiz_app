import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Custom/colors.dart';
import 'ListQuestionPage.dart';
import '../Custom/TextField.dart';

class AddQuestion extends StatefulWidget {
  AddQuestion({Key? key ,required this.subjectName,required this.className}) : super(key: key);
 String subjectName;
 String className;
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    quesController.dispose();
    c_ansController.dispose();
    w_ans1Controller.dispose();
    w_ans2Controller.dispose();
    w_ans3Controller.dispose();
    super.dispose();
  }

  String subject = "";

  var ques = "";
  var c_ans = "";
  var w_ans1 = "";
  var w_ans2 = "";
  var w_ans3 = "";

  clearText(
      String ques, String w_ans1, String w_ans2, String w_ans3, String c_ans) {
    quesController.clear();
    c_ansController.clear();
    w_ans1Controller.clear();
    w_ans2Controller.clear();
    w_ans3Controller.clear();
  }

  final quesController = TextEditingController();
  final c_ansController = TextEditingController();
  final w_ans1Controller = TextEditingController();
  final w_ans2Controller = TextEditingController();
  final w_ans3Controller = TextEditingController();

  Future<void> addUser(String subject) async {
    await FirebaseFirestore.instance
        .collection(subject)
        .add({
          'ques': ques,
          'c_ans': c_ans,
          'w_ans1': w_ans1,
          'w_ans2': w_ans2,
          'w_ans3': w_ans3,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:14.0),
          child: Text(
            'Add Questions',
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListQuestionPage(
                      subjectName: '${widget.subjectName}', className: '${widget.subjectName}',
                    ),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        color: Palette.skyblue),
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
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

                          //eng
                          RadioListTile(
                            value: "${widget.className}-eng",
                            groupValue: subject,
                            title:  Text("English"),
                            onChanged: (value) {
                              print("Current User ${value}");
                              setState(
                                () {
                                  subject = value.toString();
                                  print('${subject}');
                                  print('${value}');
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
                              setState(
                                    () {
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
                              setState(
                                    () { subject = value.toString();},
                              );},),


                           const SizedBox(height: 17,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      ques = quesController.text;
                                      c_ans = c_ansController.text;
                                      w_ans1 = w_ans1Controller.text;
                                      w_ans2 = w_ans2Controller.text;
                                      w_ans3 = w_ans3Controller.text;
                                      addUser(subject);
                                      clearText(
                                          ques, w_ans1, w_ans2, w_ans3, c_ans);
                                      _showToast(context,'user added!');
                                    });
                                  }
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1.5,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => {
                                  clearText(
                                      ques, w_ans1, w_ans2, w_ans3, c_ans),
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                child: const Text(
                                  'Reset',
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
