import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/CardDesign.dart';
import 'package:untitled2/home/usercards.dart';
import 'package:untitled2/textfeild.dart';

class UsersPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack( alignment: AlignmentDirectional.bottomEnd,
      children: [ Column(
        children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Textting('search'),
                ],
              ),
            ],
          ),
        ),
          SizedBox(height: 550,
          child: ListView(children: [
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),
            UserCard('assets/images/login2.jpeg'),

          ]),)

        ],),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 55)),
            FloatingActionButton(onPressed: (){

            },backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add,size: 45,),
            ),
          ],
        ), ],);
  }
}
