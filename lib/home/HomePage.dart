import 'package:flutter/material.dart';
import '../CardDesign.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 7,
              child: Row(children: [const Padding(padding: EdgeInsets.only(left: 30)),
                Text('Directory',
                  style: Theme.of(context).textTheme.displayLarge,)],),
            ),
            SizedBox(height: 410,
                child: Container(
                  child: GridView.count(crossAxisCount: 1, mainAxisSpacing: 8.0,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/WhiteBG.png',departmentname: 'Department 1'),
                      // CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/WhiteBG.png',departmentname: 'Department 2'),
                      // CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/WhiteBG.png',departmentname: 'Department 3'),
                      // CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/WhiteBG.png',departmentname: 'Department 4'),
                      // CardDesign(height: 350, width: 300, radius:40 ,cardimage: 'assets/images/WhiteBG.png',departmentname: 'Department 5'),
                    ],
                  ),
                )
            ),
            Expanded(flex: 4,
              child:
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [ const Padding(padding: EdgeInsets.symmetric(horizontal: 140,vertical: 45)),
                  FloatingActionButton(onPressed: (){

                  },backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.add,size: 45,),
                  ),
                ],
              ),
            )
          ],
        );
  }
}