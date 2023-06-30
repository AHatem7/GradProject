



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled2/AddNewUser.dart';
import 'package:untitled2/Add_user.dart';
import 'package:untitled2/textfeild.dart';

import '../USER/FinallChatPage.dart';
import '../backgrounds.dart';
import 'ProfilePage.dart';
import 'chatHelper.dart';
import 'chatScreen.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack( alignment: AlignmentDirectional.bottomEnd,

      children: [
        Background('assets/images/BG1.png'),
        //Image.asset('assets/images/bac.png',fit: BoxFit.fill,width: double.infinity),


        Scaffold(backgroundColor: Colors.transparent, resizeToAvoidBottomInset: false,
          drawer: Drawer(



            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.red,
                      image: DecorationImage(image: AssetImage('assets/images/img.png'),
                          fit: BoxFit.cover)

                  ),

                  child:Text(''),
                  // Icon(Icons.security_outlined,size: 50) ,
                  // decoration: BoxDecoration(
                  //   color:  Color.fromRGBO(220,205, 168,1),
                  // ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: ImageIcon(AssetImage('assets/images/pr.png')),
                      title: Text('Profile'),
                      onTap: () {
                        // Do something
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

                      },
                    ),
                    ListTile(
                      leading: ImageIcon(AssetImage('assets/images/request.png')),
                      title: Text('Chat'),
                      onTap: () {
                        // Do something
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersListPage() ));

                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black,size: 30),leadingWidth: 100,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
              ]),

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

                      return Expanded(flex: 5,
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder:(context, i) {
                              var data = snapshot.data!.docs[i];

                              return Column(
                                children: [
                                  Stack(alignment: AlignmentDirectional.center,
                                      children: [

                                        Center(
                                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Slidable(




                                                startActionPane: ActionPane(motion: DrawerMotion(),
                                                    children: [
                                                      SlidableAction(onPressed: (buildContext)async{
                                                        DocumentReference userDocRef = FirebaseFirestore.
                                                        instance.collection('user').doc(data.id);




                                                        try{

                                                         // await userDocRef.delete();
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AlertDialog(
                                                                title: Text(""),
                                                                content: Text("  Are you sure you want delete this user ?"),
                                                                actions: [
                                                                  TextButton(
                                                                    child: Text("no"),
                                                                    onPressed: () {
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    child: Text("yes"),
                                                                    onPressed: () {
                                                                       userDocRef.delete();
                                                                       Navigator.of(context).pop();
                                                                       showDialog(
                                                                         context: context,
                                                                         builder: (BuildContext context) {
                                                                           return AlertDialog(
                                                                             title: Text(""),
                                                                             content: Text("  Deleted successfully "),
                                                                             actions: [
                                                                               TextButton(
                                                                                 child: Text("close"),
                                                                                 onPressed: () {
                                                                                   Navigator.of(context).pop();
                                                                                 },
                                                                               ),

                                                                             ],
                                                                           );
                                                                         },
                                                                       );



                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );


                                                          // User? user = FirebaseAuth.instance.currentUser;
                                                          // if (user != null) {
                                                          //   await user.delete();
                                                          // }




                                                        }catch (e) {
                                                          // Show an error message to the user
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(content: Text('Error deleting user: $e')),
                                                          );
                                                        }


                                                        // // Get the current user
                                                        // User? user = FirebaseAuth.instance.currentUser;
                                                        // if (user != null) {
                                                        //   try {
                                                        //     // Delete the user
                                                        //     await user.delete();
                                                        //
                                                        //     // Show a message to the user
                                                        //     ScaffoldMessenger.of(context).showSnackBar(
                                                        //       SnackBar(content: Text('User deleted successfully')),
                                                        //     );
                                                        //   } catch (e) {
                                                        //     // Show an error message to the user
                                                        //     ScaffoldMessenger.of(context).showSnackBar(
                                                        //       SnackBar(content: Text('Error deleting user: $e')),
                                                        //     );
                                                        //   }
                                                        // }
                                                      },
                                                        backgroundColor: Colors.red,
                                                        icon: Icons.delete_outline,
                                                        label: 'Delete',

                                                      )
                                                    ]),

                                                child: GestureDetector( onTap: ()
                                                {
                                                //   Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => ChatPage(
                                                //       selectedUser: data,
                                                //     ),
                                                //   ),
                                                // );
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ChatPageFinal(
                                                        selectedUser: data,
                                                      ),
                                                    ),
                                                  );

                                                },

                                                  child: Card(


                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                                                  ),
                                                ),
                                              ),
                                            ],
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