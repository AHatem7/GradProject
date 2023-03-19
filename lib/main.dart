import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/home/BottomNavigationBarItem.dart';
import 'package:untitled2/backgrounds.dart';
import 'package:untitled2/bottumtext.dart';
import 'package:untitled2/myTheme.dart';
import 'package:untitled2/textfeild.dart';
import'package:flutter/src/painting/border_radius.dart';
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


    },
      initialRoute:DirectoryPage.routename,
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
                BottumText('Login'),
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

