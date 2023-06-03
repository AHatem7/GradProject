import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
String name;
String id;
String avatarimage;
String message;
RequestCard({Key? key, this.name='',this.avatarimage='',this.id='',this.message=''}) : super(key: key);

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
                    padding: const EdgeInsets.only(left: 55,top: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                      Row (mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],),
                      Row (mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(id,style: const TextStyle(fontSize:20),)],),
                    ],),
                  ),

                    Expanded(flex: 3,
                      child: Row (mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(message,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold))],),
                    ),
            ]),
              alignment: Alignment.center,
              constraints:  const BoxConstraints(
                maxWidth: 320,
                maxHeight: 250,
              ),
              color: Colors.white,


            ),
          ),



            FractionalTranslation(
              translation: const Offset(0.0, -0.9),
              child: Align(
                child: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                         'assets/images/userN.png',fit: BoxFit.fill,width: double.infinity,)
                    )
                ),
                alignment: const FractionalOffset(0.17, 0.0),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0.0,2.5),
              child: Align(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   ElevatedButton(onPressed: (){}, child:const Text('Accept'),
                     style: ElevatedButton.styleFrom(fixedSize: const Size(110, 50),
                         primary: Theme.of(context).primaryColor,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), ),
                    ElevatedButton(onPressed: (){}, child:const Text('Reject'),
                      style: ElevatedButton.styleFrom(fixedSize: const Size(110, 50),
                          primary: const Color.fromARGB(255, 168, 32, 32),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), ),

                  ],
                ),
                alignment: const FractionalOffset(0.2, 0.0),
              ),
            ),




          ],
        ),
        const SizedBox(height: 60,)


      ],
    );
  }
}

