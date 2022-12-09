import 'package:flutter/material.dart';
import 'package:untitled7/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class questions extends StatefulWidget {
  const questions({Key? key}) : super(key: key);

  @override
  State<questions> createState() => _questionsState();
}

class _questionsState extends State<questions> {
  Color mainColor = Color(0xFF252c4a);
  Color primaryColor = Color(0xFF117eeb);
  late String stringResponse;
  late Map mapResponse;
  late Map dataResponse;
  List? listResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }

  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://opentdb.com/api.php?amount=10&category=18&difficulty=hard&type=multiple"));
    if (response.statusCode == 200) {
      setState() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['question'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          itemCount: listResponse == null ? 0 : listResponse?.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    color: Colors.white60,
                    child: Text("hi"),
                    height: 200,
                    width: 200),
                Text("question $index"),
                Text(listResponse![index]['question'].toString()),
                Text(listResponse![index]['correctAnswer'].toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
