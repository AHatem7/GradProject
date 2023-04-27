import 'package:flutter/material.dart';

class ReqestCard extends StatelessWidget {
String name;
String id;
String avatarimage;
String message;
ReqestCard({this.name='',this.avatarimage='',this.id='',this.message=''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(

              child: Column(
                  children: [Container(
                    padding: EdgeInsets.only(left: 55,top: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Row (mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],),
                      Row (mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(id,style: TextStyle(fontSize:20),)],),
                    ],),
                  ),

                    Expanded(flex: 3,
                      child: Row (mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(message,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],),
                    ),
            ]),
              alignment: Alignment.center,
              constraints:  BoxConstraints(
                maxWidth: 320,
                maxHeight: 250,
              ),
              color: Colors.white,


            ),
          ),



            FractionalTranslation(
              translation: Offset(0.0, -0.9),
              child: Align(
                child: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          'avatarimage',fit: BoxFit.fill,width: double.infinity,)
                    )
                ),
                alignment: FractionalOffset(0.17, 0.0),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0,2.5),
              child: Align(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   ElevatedButton(onPressed: (){}, child:Text('Accept'),
                     style: ElevatedButton.styleFrom(fixedSize: Size(110, 50),
                         primary: Theme.of(context).primaryColor,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), ),
                    ElevatedButton(onPressed: (){}, child:Text('Reject'),
                      style: ElevatedButton.styleFrom(fixedSize: Size(110, 50),
                          primary: Color.fromARGB(255, 168, 32, 32),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), ),

                  ],
                ),
                alignment: FractionalOffset(0.2, 0.0),
              ),
            ),




          ],
        ),
        SizedBox(height: 60,)


      ],
    );;
  }
}

