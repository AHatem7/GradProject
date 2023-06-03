import 'package:flutter/material.dart';

class BottumText extends StatelessWidget {
  String bottumName;
  BottumText(this.bottumName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){

    },
        style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(220, 205, 168, 1),
            fixedSize: const Size(300, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),

        child: Text(bottumName,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
  }
}
