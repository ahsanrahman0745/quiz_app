// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../Custom/colors.dart';
// import 'AddQuestion.dart';
// import 'UpdateQuestion.dart';
// class Cls9List extends StatefulWidget {
//    Cls9List({Key? key}) : super(key: key);
//
//   @override
//   State<Cls9List> createState() => _Cls9ListState();
// }
//
// class _Cls9ListState extends State<Cls9List> {
//   var id = '';
//
//   deleteUser(String id) async {
//     // print("User Deleted $id");
//     await FirebaseFirestore.instance
//         .collection('class9')
//         .doc(id)
//         .delete()
//         .then((value) => print('User Deleted'))
//         .catchError((error) => print('Failed to Delete user: $error'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//
//           TextButton(onPressed: (){
//
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) => AddQuestion( ),),);
//           },
//             child: Text('Add ',
//               style: TextStyle(color:Palette.honey_yellow,
//                 fontSize: 30,wordSpacing: 2,
//                 fontWeight: FontWeight.bold,),
//             ),),
//
//
//         ],
//         // toolbarHeight: 80,
//         backgroundColor: Palette.darkblue,
//         elevation: 6,
//         title: const Text(
//           'Questions',
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 36 ,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1.5),
//         ),
//         centerTitle: true,
//         leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {  },),
//       ),
//
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('class9').snapshots(),
//           builder: (BuildContext context, snapshot) {
//             if (snapshot.hasError) {
//               print('Something went Wrong');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting ) {
//               return  Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return ListView.builder(
//               itemCount: snapshot.data?.docs.length,
//               itemBuilder: (context, index) {
//                 var documentSnapshot = snapshot.data?.docs;
//
//
//
//                 return Column(
//                   children: [
//
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(Radius.circular(14)),
//                           color: Palette.skyblue
//                       ),
//
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 8.0, vertical: 9.0),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: 7.0, vertical: 8.0),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Column(
//                             children: [
//
//
//
//                               Row(
//                                 children: [
//                                   Text('Q:',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,color: Palette.darkblue,),),
//
//                                   Expanded(
//                                     child: Container(
//                                       width: 500,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(14.0),
//                                         ),
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               '${documentSnapshot![index]['ques']}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Palette.darkblue)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               Row(
//                                 children: [
//                                   Expanded(flex: 1,child: Text(':1',textDirection: TextDirection.rtl,
//                                     style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Palette.darkblue,),)),
//
//                                   Expanded(flex: 8,
//                                     child:   Container(
//                                       width: 340,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(14.0),
//                                         ),
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               '${documentSnapshot[index]['w_ans1']}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Palette.darkblue)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(flex: 1,child: Text(':2',textDirection: TextDirection.rtl,
//                                     style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Palette.darkblue,),)),
//
//                                   Expanded(flex: 8,
//                                     child:   Container(
//                                       width: 340,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(14.0),
//                                         ),
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               '${documentSnapshot[index]['w_ans2']}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Palette.darkblue)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               Row(
//                                 children: [
//                                   Expanded(flex: 1,child: Text(':3',textDirection: TextDirection.rtl,
//                                     style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Palette.darkblue,),)),
//
//                                   Expanded(flex: 8,
//                                     child:  Container(
//                                       width: 340,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(14.0),
//                                         ),
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               '${documentSnapshot[index]['w_ans3']}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Palette.darkblue)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(flex: 1,child: Text(':4',textDirection: TextDirection.rtl,
//                                     style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Palette.darkblue,),)),
//
//                                   Expanded(flex: 8,
//                                     child:  Container(
//                                       width: 340,
//                                       child: Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(14.0),
//                                         ),
//                                         color: Colors.green,
//                                         child: Padding(
//                                           padding: EdgeInsets.all(8.0),
//                                           child: Text(
//                                               '${documentSnapshot[index]['c_ans']}',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: Colors.white)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//
//
//
//
//
//
//
//
//                               Container(
//                                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Card(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(14.0),
//                                       ),
//                                       color: Colors.blue,
//                                       child:IconButton(onPressed:(){
//                                         Navigator.push(context, MaterialPageRoute(
//                                           builder: (context) =>
//                                               UpdateQuestion(id: documentSnapshot[index].id, colName: widget.class,),),);
//                                       }, icon: Icon(Icons.edit,color: Colors.white,)),
//                                     ),
//                                     SizedBox(width: 20,),
//                                     Card(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(14.0),
//                                       ),
//                                       color: Colors.redAccent,
//                                       child:IconButton(onPressed:(){
//                                         deleteUser(documentSnapshot[index].id);
//                                       }, icon: Icon(Icons.delete,color: Colors.white,)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }),
//     );
//   }
// }
