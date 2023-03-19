import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CardDesign.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 7,
              child: Row(children: [Padding(padding: EdgeInsets.only(left: 30)),
                Text('Directory',
                  style: Theme.of(context).textTheme.headline1,)],),
            ),
            SizedBox(height: 410
                ,
    child: Container(
      child: GridView.count(crossAxisCount: 1, mainAxisSpacing: 8.0,
        scrollDirection: Axis.horizontal,
      children: [
        CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/123.jpg',departmentname: 'depart'),
        CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/123.jpg',departmentname: 'depart'),
        CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/123.jpg',departmentname: 'depart'),
        CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/123.jpg',departmentname: 'depart'),
        CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/123.jpg',departmentname: 'depart'),
      ],),
    )

            ),Expanded(flex: 4,
              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [ Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 45)),
                  FloatingActionButton(onPressed: (){

                  },backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.add,size: 45,),
                  ),

                ],
              ),
            )
          ],
        );
  }
}