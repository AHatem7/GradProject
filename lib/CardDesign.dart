import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  double height;
double width;
double radius;
String cardimage;
String departmentname;

CardDesign( { this.height=150,  this.width=300,  this.radius=50, this.cardimage='', this.departmentname=''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [ Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            child: InkWell(
              onTap: () {
             },
              child: Container(
                width:width,
                height:height,decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 7.0,)],borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(image: AssetImage(cardimage),
                    fit: BoxFit.fill),
              )),

              ),
            ),
    ],
        ),
         SizedBox(height:10), Text(departmentname,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1),

      ],
    );
  }
}




