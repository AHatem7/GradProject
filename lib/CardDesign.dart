import 'package:flutter/material.dart';
import 'package:untitled2/Departments.dart';

class CardDesign extends StatelessWidget {
  double height;
  double width;
  double radius;
  String cardimage;
  String departmentname;


CardDesign( {Key? key,  this.height=1,  this.width=1,  this.radius=1, this.cardimage='', this.departmentname='',}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [
            Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            child: InkWell(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> const Departments()));
             },
              child: Container(
                width:width,
                height:height,decoration: BoxDecoration(
                boxShadow: const [BoxShadow(blurRadius: 7.0,)],borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(image: AssetImage(cardimage),
                    fit: BoxFit.fill),
              )),

              ),
            ),
    ],
        ),
         const SizedBox(height:10), Text(departmentname,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1),

      ],
    );
  }
}




