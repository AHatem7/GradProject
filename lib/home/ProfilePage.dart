import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:untitled2/Departments.dart';
import 'package:untitled2/backgrounds.dart';
import 'package:untitled2/dataprofile.dart';
import 'package:untitled2/profilepage_edit.dart';
import 'package:untitled2/main.dart';

import '../login/LoginHelper.dart';

class ProfilePage extends StatelessWidget {
static String routename ='profile page';
final currentUser = FirebaseAuth.instance;
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Background('assets/images/BG1.png'),


        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
          body: Column(

          children: [

Expanded(
      child: Row(children: [SizedBox(width: 20,),
        // FloatingActionButton(onPressed: (){
        //   Navigator.pop(context, MaterialPageRoute(builder: (context)=> Departments()));
        //
        // }, child: Icon(Icons.arrow_back,color: Colors.black),
        //     backgroundColor: Colors.white),
      ],)),

            Expanded(
              child:
              StreamBuilder(

                  stream: FirebaseFirestore.instance.collection("user").where("uid",isEqualTo: currentUser.currentUser!.uid).snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){

                    if(snapshot.hasData){

                      return Expanded(flex: 2,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder:(context, i) {
                              var data = snapshot.data!.docs[i];

                              return Column(
                                children: [
                                  Stack(alignment: AlignmentDirectional.center,
                                      children: [
                                        Column(crossAxisAlignment: CrossAxisAlignment.start
                                          ,mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // Row(
                                            //   children: [ SizedBox(width: 50),
                                            //     Icon(Icons.person_rounded),
                                            //     SizedBox(height: 30,width: 15),
                                            //     Text('Name:',style:TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 15,fontWeight: FontWeight.bold) ),
                                            //   ],
                                            // ),
                                            // Row(
                                            //   children: [Padding(padding: EdgeInsets.symmetric(horizontal: 42)),
                                            //     // SizedBox(width: 18,),
                                            //     //SizedBox(width: 18,),
                                            //     Text(data['firstname'],style:  TextStyle(fontSize: 14)),
                                            //     SizedBox(width: 18,),
                                            //     Text(data['lastname'],style: TextStyle(fontSize: 14)),
                                            //   ],
                                            // ),SizedBox(height: 55,),
                                            // const Divider(
                                            //   color: Colors.black12,
                                            //   height: 20,
                                            //   thickness: 1.2,indent: 75,endIndent: 30,
                                            // ),SizedBox(height: 25),

                                            Row(
                                              children: [
                                                SizedBox(width: 25,), Icon(Icons.person_rounded),SizedBox(width: 15,),
                                                Text('Name:',
                                                    style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),
                                                        fontSize: 20,fontWeight: FontWeight.bold)),
                                                SizedBox(width: 18,),
                                                Text(data['firstname'],style:TextStyle(fontSize: 18)),SizedBox(width: 18,),
                                                Text(data['lastname'],style: TextStyle(fontSize: 18)),
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.black12,
                                              height: 20,
                                              thickness: 1.2,indent: 75,endIndent: 30,),
                                            SizedBox(height: 30),
                                            Row(
                                              children: [
                                                SizedBox(width: 25,), Icon(Icons.email),SizedBox(width: 15,),
                                                Text('Email:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 20,fontWeight: FontWeight.bold)),
                                                SizedBox(width: 18,),
                                                Text(data['email'],style:TextStyle(fontSize: 18)),
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.black12,
                                              height: 20,
                                              thickness: 1.2,indent: 75,endIndent: 30,


                                            ),SizedBox(height: 30),
                                            Row(
                                              children: [
                                                SizedBox(width: 25,),
                                                Icon(Icons.phone),SizedBox(width: 15,),
                                                Text('Phone:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 20,fontWeight: FontWeight.bold)),
                                                SizedBox(width: 18,),
                                                Text(data['phone'],style: TextStyle(fontSize: 18)),
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.black12,
                                              height: 20,
                                              thickness: 1.2,indent: 75,endIndent: 30,


                                            ),SizedBox(height: 30),
                                            Row(
                                              children: [
                                                SizedBox(width: 25,),
                                                Icon(Icons.desktop_mac),SizedBox(width: 15,),
                                                Text('Department:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 20,fontWeight: FontWeight.bold)),
                                                SizedBox(width: 18,),
                                                Text(data['department'],style: TextStyle(fontSize: 18)),
                                              ],

                                            ),
                                            const Divider(
                                              color: Colors.black12,
                                              height: 20,
                                              thickness: 1.2,indent: 75,endIndent: 30,
                                            ),

                                          ],
                                        )
                                      ] ),
                                  //SizedBox(height: 20)
                                ],
                              );
                            }
                        ),
                      );
                    }else {
                      return CircularProgressIndicator();
                    }
                  }
              ),
            ),


          //   const Divider(
          //     color: Colors.black12,
          //     height: 20,
          //     thickness: 1.2,indent: 75,endIndent: 30,
          //
          //
          //   ),
          //   Row(
          //     children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.email),
          //       DataProfile(label: 'Personal E-Mail', content: 'Admin@gmail.com'),
          //     ],
          //   ),
          //   const Divider(
          //     color: Colors.black12,
          //     height: 20,
          //     thickness: 1.2,indent: 75,endIndent: 30,
          //
          //
          //   ),
          //   Row(
          //   children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.phone),
          //     DataProfile(label: 'Phone Number', content: '0111111002'),
          //   ],
          // ),
          //   const Divider(
          //     color: Colors.black12,
          //     height: 20,
          //     thickness: 1.2,indent: 75,endIndent: 30,
          //
          //
          //   ),
          //   Row(
          //    children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.lock),
          //      DataProfile(label: 'Password', content:'********'),
          //    ],),
          //   const Divider(
          //     color: Colors.black12,
          //     height: 20,
          //     thickness: 1.2,indent: 75,endIndent: 30,
          //
          //
          //   ),
          //  Row(
          //    children: [const Padding(
          //        padding: EdgeInsets.only(left: 25)),const Icon(Icons.desktop_mac),
          //      DataProfile(label: 'Department', content: 'Flutter Developer'),
          //    ],
          //  ),
          //   const Divider(
          //     color: Colors.black12,
          //     height: 20,
          //     thickness: 1.2,indent: 75,endIndent: 30,
          //
          //
          //   ),


            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){

                    AuthService authservice = AuthService();
                    authservice.logoutUser(context);
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

                  }, child: Text('Logout',
                    style: TextStyle(
                        color: Color.fromRGBO(196, 25, 14, 1.0),fontSize: 25,
                        fontWeight: FontWeight.bold),)),

                  // IconButton(onPressed: (){
                  //
                  //
                  // }, icon: Icon(Icons.logout))


                ],
              ),
            ),
            // const Spacer()



      ],),
        ),
      ], );
  }
}