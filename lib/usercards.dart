import 'package:flutter/material.dart';
import 'package:untitled2/viewuser.dart';

import 'database/Attuser(tofirebase).dart';



class UserCard extends StatelessWidget {
String name;
String Id;


UserCard({Key? key, required this.name,required this.Id}) : super(key: key);

  // MyUser myUser;
  // UserCard(this.myUser);



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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ViewUser()));

              },
              child: Container( padding: const EdgeInsets.only(left:110),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(name,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                          // Text(myUser.lName)
                        ],
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: [
                          Text(Id),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Text(myUser.phone),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Text(myUser.department),
                      //   ],
                      // ),
                    ],
                  ),
                  width:315,
                  height:160,decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),

              )),

            ),
          ),

            // FractionalTranslation(
            // translation: const Offset(0.0, -0.2),
            // child: Align(
            // child: CircleAvatar(
            // radius: 35.0,
            // child: ClipRRect(
            //     borderRadius: BorderRadius.circular(35),
            //     child: Image.asset(
            //       avatarimage,fit: BoxFit.fill,width: double.infinity,)
            // )
            // ),
            // alignment: const FractionalOffset(0.2, 0.0),
            // ),
            // ),

            const SizedBox(height: 350,)
          ],
        ),

      ],
    );
  }
}

