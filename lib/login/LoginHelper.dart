

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/USER/homePage.dart';
import 'package:untitled2/choose/choose.dart';

import 'package:untitled2/home/UsersPage.dart';

import '../USER/userNavBar.dart';
import '../home/BottomNavigationBarItem.dart';
import 'LoGinPage.dart';

class AuthService{
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController role = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void hendi111(context)async{
    try{
      showDialog(context: context, builder: (context){

        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });



      UserCredential userCredential =
      await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      QuerySnapshot userSnapshot = await firestore
          .collection('user')
          .where('uid', isEqualTo: userCredential.user!.uid)
          .get();

      //  if (userSnapshot.docs.length == 1) {
      //   String role = userSnapshot.docs[0]['role'];
      //   if (role == 'admin') {
      //     // Navigate to the admin dashboard
      //     Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => DirectoryPage()),
      //           (route) => false,
      //     );
      //
      //   }
      //
      // }

      if (userSnapshot.docs.length == 1) {
        String role = userSnapshot.docs[0]['role'];
        if (role == 'user') {

          // Navigate to the admin dashboard
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => UserNavBar()),
                (route) => false,
          );

        }

      }



       if (userSnapshot.docs.length == 1) {
        String role = userSnapshot.docs[0]['role'];
        if (role == 'admin') {
          // Navigate to the admin dashboard
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DirectoryPage()),
                (route) => false,
          );

        }

      }





      // // Retrieve the user document from Firestore
      // DocumentSnapshot userDoc = await firestore.collection('user').doc(userCredential.user!.uid).get();
      //
      // // Check the user's role to determine which dashboard to navigate to
      // if (userDoc.exists && userDoc.get('role') == 'admin') {
      //   // Navigate to the admin dashboard
      //   // Navigator.pushAndRemoveUntil(
      //   //   context,
      //   //   MaterialPageRoute(builder: (context) => DirectoryPage()),
      //   //       (route) => false,
      //   // );
      //   Navigator.pushAndRemoveUntil(
      //       context, MaterialPageRoute(builder:(context)=>DirectoryPage() ),(route) => false,
      //        );
      // } else{
      //   print('ERROR');
      // }


    }catch(e){

      // AlertDialog(
      //   title: Center(
      //     child: Text('error message'),
      //
      //   ),
      // );
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("SomeThing went wrong"),
            content: Text(" Unvalid email or password  "),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );




      }
  }

  ///////////////////////////////////////////////////////////////

  void hendiregester(context)async{
    try{
      showDialog(context: context, builder: (context){

        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text).then((value) {
        print('user is regesterd');
        firestore.collection('user').add({
          "email":email.text,
          "firstname":firstname.text,
          "lastname":lastname.text,
          "phone":phone.text,
          "department":department.text,
          "role":role.text,
          "uid":auth.currentUser!.uid,

        });
        Navigator.push(context, MaterialPageRoute(builder:(c)=> DirectoryPage()));

      });
    }catch(e){
      Navigator.pop(context);
      AlertDialog(
        title: Center(
          child:  Text('erorr message'),

        ),
      );
      ;}
  }


  void logoutUser( context)async{

    await auth.signOut();
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => LoGinPage(), ), (route) => false);
  }
}

