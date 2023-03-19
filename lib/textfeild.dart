import 'package:flutter/material.dart';

class Textting extends StatelessWidget {

String title;
Textting(this.title);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:300,
      height: 50,
      child: TextField(


        decoration:  InputDecoration(filled: true,fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: BorderSide(width: 0,style: BorderStyle.none)),


            hintText:title ,hintStyle: TextStyle(color: Colors.black26, )
        ),
      ),
    );

  }
}


