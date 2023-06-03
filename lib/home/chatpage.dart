// import 'package:flutter/material.dart';
// import 'package:untitled2/requestcard.dart';
//
// class RequestPage extends StatelessWidget {
//   const RequestPage({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               Column(mainAxisAlignment: MainAxisAlignment.end,
//                 children: const [],
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 620,
//           child: ListView(children: [
//             RequestCard(name: 'Lojain Amr',id: '89504', message: "Want to access 'this file'"),
//             RequestCard(name: 'Salma Abdelrazek',id: '89575', message: "Want to access 'this file'"),
//             RequestCard(name: 'Sohaila Mohamed',id: '89459', message: "Want to access 'this file'"),
//             RequestCard(name: 'Hesham Saleh',id: '89581', message: "Want to access 'this file'"),
//             RequestCard(name: 'Nouran Ashraf',id: '89550', message: "Want to access 'this file'"),
//
//
//           ]),)
//
//       ],);
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////



//
// import 'package:flutter/material.dart';
//
// import '../backgrounds.dart';
//
// class Chat extends StatelessWidget {
//   //const Chat({Key? key}) : super(key: key);
//   static String routename = 'chat';
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//
//
//         Background('assets/images/BG1.png'),
//
//
//
//
//
//       ],
//
//     );
//   }
// }
//////////////////////////////////////////////////////////////////


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../backgrounds.dart';
import 'message.dart';

class chatpage extends StatefulWidget {
  static String routename = 'chatpage';
  String email;
  chatpage({required this.email});
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
  String email;
  _chatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background('assets/images/BG1.png'),


      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0),



        // appBar: AppBar(
        //   title: Text(
        //     'data',
        //   ),
        //   // actions: [
        //   //   MaterialButton(
        //   //     onPressed: () {
        //   //       _auth.signOut().whenComplete(() {
        //   //         Navigator.pushReplacement(
        //   //           context,
        //   //           MaterialPageRoute(
        //   //             builder: (context) => Home(),
        //   //           ),
        //   //         );
        //   //       });
        //   //     },
        //   //     child: Text(
        //   //       "signOut",
        //   //     ),
        //   //   ),
        //   // ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.79,
                child: messages(
                  email: email,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                        //Colors.white,
                        Color.fromRGBO(220,205, 168,1),
                        hintText: 'message',
                        // hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {},
                      onSaved: (value) {
                        message.text = value!;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (message.text.isNotEmpty) {
                        fs.collection('Messages').doc().set({
                          'message': message.text.trim(),
                          'time': DateTime.now(),
                          'email': email,
                        });

                        message.clear();
                      }
                    },
                    icon: Icon(Icons.send_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ], );
  }
}