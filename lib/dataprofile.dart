import 'package:flutter/material.dart';

class DataProfile extends StatelessWidget {
String label;
String content;

DataProfile({required this.label,required this.content});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Row(

        children: [
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,style: Theme.of(context).textTheme.titleLarge,),
                Text(content,style: Theme.of(context).textTheme.titleLarge,),


              ],
            ),
          )

        ],
      ),
    );
  }
}
