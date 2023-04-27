import 'package:flutter/material.dart';
import 'package:untitled2/home/HomePage.dart';
import 'package:untitled2/uplode_file.dart';

import 'CardDesign.dart';
import 'drop_bottom.dart';

class Departments extends StatelessWidget {
static const String routename ='departments';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Image.asset('assets/images/bac.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover),




        Scaffold(
            backgroundColor: Colors.transparent,


            body:
            Column(
              children: [
                Expanded(child: Row(children: [],)),
                Expanded(
                  child: Row(
                    children: [Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                      FloatingActionButton(onPressed: (){
                        Navigator.pop(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      },
                        child: Icon(Icons.arrow_back,color: Colors.black,size: 35),
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                ),
                Center(
                  child:
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Department 1',style:
                        TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                DropDownButton()

                ,SizedBox(
                  height: 520,
                  child: GridView.count(
                    padding: EdgeInsets.all(30),
                    crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,
                    children: [
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),
                      CardDesign(height: 100, width: 100, radius: 40,
                          cardimage: 'assets/images/bac.png'),


                    ],
                  ),
                ),
              ],
            )




        ),
        Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 55)),
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadFile()));
            },
              child: Icon(Icons.add,color: Colors.white, size: 45,),
              backgroundColor: Color.fromRGBO(220, 205, 168, 1),
            ),
          ],
        ),
      ],

    );
  }
}
