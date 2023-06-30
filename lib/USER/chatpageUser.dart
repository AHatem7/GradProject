//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/USER/FinallChatPage.dart';
//
// import '../backgrounds.dart';
// import '../home/chatScreen.dart';
// import '../home/message.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
//
// class UsersListPage22 extends StatefulWidget {
//   static String routename ='yy';
//   @override
//   _UsersListPage22State createState() => _UsersListPage22State();
// }
//
// class _UsersListPage22State extends State<UsersListPage22> {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users List'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: firestore
//             .collection('user')
//             .where('uid', isNotEqualTo: auth.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           List<DocumentSnapshot> documents = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot document = documents[index];
//               return ListTile(
//                 title: Text(document['firstname'] + ' ' + document['lastname']),
//                 subtitle: Text(document['email']),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ChatPage(selectedUser: document)),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// class chatpageuser extends StatefulWidget {
//   static String routename = 'chatpageuser';
//   String email;
//   chatpageuser({required this.email});
//   @override
//   _chatpageuserState createState() => _chatpageuserState(email: email);
// }
//
// class _chatpageuserState extends State<chatpageuser> {
//   String email;
//   _chatpageuserState({required this.email});
//
//   final fs = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   final TextEditingController message = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Background('assets/images/BG1.png'),
//
//
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0),
//
//
//
//           // appBar: AppBar(
//           //   title: Text(
//           //     'data',
//           //   ),
//           //   // actions: [
//           //   //   MaterialButton(
//           //   //     onPressed: () {
//           //   //       _auth.signOut().whenComplete(() {
//           //   //         Navigator.pushReplacement(
//           //   //           context,
//           //   //           MaterialPageRoute(
//           //   //             builder: (context) => Home(),
//           //   //           ),
//           //   //         );
//           //   //       });
//           //   //     },
//           //   //     child: Text(
//           //   //       "signOut",
//           //   //     ),
//           //   //   ),
//           //   // ],
//           // ),
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.79,
//                   child: messages(
//                     email: email,
//                   ),
//                 ),
//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: message,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor:
//                           //Colors.white,
//                           Color.fromRGBO(220,205, 168,1),
//                           hintText: 'message',
//                           // hintStyle: TextStyle(color: Colors.black,fontSize: 15),
//                           enabled: true,
//                           contentPadding: const EdgeInsets.only(
//                               left: 14.0, bottom: 8.0, top: 8.0),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
//                             borderRadius: new BorderRadius.circular(15),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
//                             borderRadius: new BorderRadius.circular(10),
//                           ),
//                         ),
//                         validator: (value) {},
//                         onSaved: (value) {
//                           message.text = value!;
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         if (message.text.isNotEmpty) {
//                           fs.collection('Messages').doc().set({
//                             'message': message.text.trim(),
//                             'time': DateTime.now(),
//                             'email': email,
//                           });
//
//                           message.clear();
//                         }
//                       },
//                       icon: Icon(Icons.send_sharp),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ], );
//   }
// }