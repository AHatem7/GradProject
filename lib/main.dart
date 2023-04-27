import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Add_user.dart';
import 'package:untitled2/Departments.dart';

import 'package:untitled2/editviewuser.dart';
import 'package:untitled2/home/BottomNavigationBarItem.dart';
import 'package:untitled2/backgrounds.dart';
import 'package:untitled2/bottumtext.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'package:untitled2/home/profilepage_edit.dart';
import 'package:untitled2/myTheme.dart';
import 'package:untitled2/textfeild.dart';
import'package:flutter/src/painting/border_radius.dart';
import 'package:untitled2/uplode_file.dart';
import 'package:untitled2/viewuser.dart';
void main (){

  runApp(MyApp());

}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'grad',
      debugShowCheckedModeBanner: false,
      routes: {
      LoginPage.routename:(context) => LoginPage(),
        DirectoryPage.routename:(context) => DirectoryPage(),
        Profile_Edit.routename:(context) => Profile_Edit(),
        ProfilePage.routename :(context) => ProfilePage(),
        ViewUser.routename: (context) => ViewUser(),
        EditViewUser.routename: (context) => EditViewUser(),
        AddUser.routeName:(context) => AddUser(),
        Departments.routename:(context) => Departments(),
        UploadFile.routename:(context) => UploadFile(),
        AddUser.routeName:(context) => AddUser(),



    },
      initialRoute:LoginPage.routename,
      theme: MyThemeData.Lighttheme,

    );
  }
}

class LoginPage extends StatelessWidget {
static const String routename='login page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(children: [
        Background('assets/images/login2.jpeg'),
        Column(children: [
          Expanded(flex: 2,
            child: Row(
                children: [


                ]),
          ),

          Expanded(flex: 3,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Welcome',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),],),
                Spacer(),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textting('E-mail'),],
                ),Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Textting('password'),],
                ),Spacer(),
                TextButton(onPressed: (){}, child: Text('Forget your password?',
                style: TextStyle(color: Colors.black26),)),
                Spacer(),
              ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> DirectoryPage()));

              },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(220, 205, 168, 1),
                      fixedSize: Size(300, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),

                  child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                Spacer(),

              ],
            ),
          ),

          Expanded(flex: 2,
            child: Row(
                children: []),
          ),
        ],)
     ] )

      );

  }
}

