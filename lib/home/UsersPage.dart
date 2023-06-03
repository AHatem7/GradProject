

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/AddNewUser.dart';
import 'package:untitled2/Add_user.dart';
import 'package:untitled2/textfeild.dart';

import '../backgrounds.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack( alignment: AlignmentDirectional.bottomEnd,

      children: [
        Background('assets/images/BG1.png'),
        //Image.asset('assets/images/bac.png',fit: BoxFit.fill,width: double.infinity),


        Scaffold(backgroundColor: Colors.transparent, resizeToAvoidBottomInset: false,
          body:Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Column(mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Textting('search'),
                    //   ],
                    // ),
                  ],
                ),
              ),
              // SizedBox(height: 550,


              StreamBuilder(stream: FirebaseFirestore.instance.collection("user").snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){

                    if(snapshot.hasData){

                      return Expanded(flex: 4,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder:(context, i) {
                              var data = snapshot.data!.docs[i];

                              return Column(
                                children: [
                                  Stack(alignment: AlignmentDirectional.center,
                                      children: [
                                        Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          child: Container(
                                            height: 180,
                                            width: 325,

                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start
                                              ,mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(width: 18,),
                                                    Text('Name:',style:TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 15,fontWeight: FontWeight.bold) ),
                                                    SizedBox(width: 18,),
                                                    Text(data['firstname'],style:  TextStyle(fontSize: 14)),
                                                    SizedBox(width: 18,),
                                                    Text(data['lastname'],style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(width: 18,),
                                                    Text('Email:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 15,fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 18,),
                                                    Text(data['email'],style:TextStyle(fontSize: 13)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(width: 18,),
                                                    Text('Phone:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 15,fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 18,),
                                                    Text(data['phone'],style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(width: 18,),
                                                    Text('Department:',style: TextStyle(color: Color.fromRGBO(206,185, 151, 1),fontSize: 15,fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 18,),
                                                    Text(data['department'],style: TextStyle(fontSize: 14)),
                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        )
                                      ] ),
                                  SizedBox(height: 20)],
                              );
                            }
                        ),
                      );
                    }else {
                      return CircularProgressIndicator();
                    }
                  }
              )



            ],),
        ),

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [const Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 55)),
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ADDUser()));
            },backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add,size: 45,),
            ),
          ],
        ), ],);
  }
}