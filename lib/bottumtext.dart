import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottumText extends StatelessWidget {
  String bottumName;
  BottumText(this.bottumName);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){

    },
        style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(220, 205, 168, 1),
            fixedSize: Size(300, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),

        child: Text(bottumName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
  }
}
