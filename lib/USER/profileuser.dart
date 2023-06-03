import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:untitled2/USER/homePage.dart';
import 'package:untitled2/dataprofile.dart';
import 'package:untitled2/main.dart';

import '../backgrounds.dart';
import 'UserHelper.dart';



class  ProfilePageUser1 extends StatelessWidget {
  static String routename ='profile page';
  final currentUser = FirebaseAuth.instance;
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Background('assets/images/BG1.png'),
        Scaffold(
          appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,actions: [
        //Navigator.pop(context, MaterialPageRoute(builder: (context)=> UsersPage()));

        ]),
        backgroundColor: Colors.transparent,

        body: Column(
          children: [

            // PDF().cachedFromUrl('https://firebasestorage.googleapis.com/v0/b/gradprojectfinal-ca1d1.appspot.com/o/test%2Ftask%201%20ui.pdf?alt=media&token=ad4e2a70-24e5-4229-8b05-3dcfea7a248e'),
            // const Spacer(),
            //   Expanded(
            //   child:
            //   Row(mainAxisAlignment: MainAxisAlignment.end,
            //     children: [IconButton(onPressed: (){
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_Edit()));
            //     },
            //         icon: const Icon(Icons.edit,size: 35)),
            //       const Padding(
            //           padding: EdgeInsets.only(right: 25),)
            //
            //
            //     ],
            //   ),
            // ),
            //   Expanded(flex: 3,
            //      child:
            //      Row(
            //        children: [ const Padding(padding: EdgeInsets.all(20)),
            //
            //       const CircleAvatar(foregroundColor: Colors.white,child: Icon(Icons.person_rounded,size: 70)  ,maxRadius: 60,backgroundColor: Colors.blueGrey,),
            //        const SizedBox(width: 20,),
            //          Column(mainAxisAlignment: MainAxisAlignment.center,
            //            children: [
            //              Text('Admin',style: Theme.of(context).textTheme.headline1,),
            //              Text('89663',style: Theme.of(context).textTheme.titleLarge,),
            //
            //       ],
            //     ),
            //   ],
            //
            // ),
            //   ),
            //   const SizedBox(height:25 ,),
            // Row(
            //   children: [const Padding(padding: EdgeInsets.only(left: 25)),const Icon(Icons.email_outlined),
            //     DataProfile(label: 'E-Mail', content: '89663@abc.org.eg'),
            //   ],
            // ),



            Expanded(
                child: Row(children: [],)),

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
                                                Text('Name:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 20,fontWeight: FontWeight.bold)),
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

                    useehelper authservice = useehelper();
                    authservice.logoutUserss(context);
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
      ],);
  }
}