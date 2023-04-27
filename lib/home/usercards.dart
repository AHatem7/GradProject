import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/viewuser.dart';



class UserCard extends StatelessWidget {
String avatarimage;
String name;
String Id;


UserCard({required this.avatarimage,required this.name,required this.Id});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [
            Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewUser()));

              },
              child: Container( padding: EdgeInsets.only(left:110),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Text(Id),
                        ],
                      ),
                    ],
                  ),
                  width:315,
                  height:160,decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),

              )),

            ),
          ),

            FractionalTranslation(
            translation: Offset(0.0, -0.2),
            child: Align(
            child: CircleAvatar(
            radius: 35.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  avatarimage,fit: BoxFit.fill,width: double.infinity,)
            )
            ),
            alignment: FractionalOffset(0.2, 0.0),
            ),
            ),
            SizedBox(height: 180,)
          ],
        ),

      ],
    );;
  }
}

