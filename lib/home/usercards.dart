import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
String avatarimage;
UserCard(this.avatarimage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [ Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {

              },
              child: Container(
                  width:300,
                  height:150,decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),

              )),

            ),
          ),



            // Column(
          //   children: [
          //     Row(children: [Text('dataaaaaa')],),Row(children: [Text('data')],),
          //   ],
          // ),




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
            alignment: FractionalOffset(0.23, 0.0),
            ),
            ),
            SizedBox(height: 180,)
          ],
        ),



      ],
    );;
  }
}
