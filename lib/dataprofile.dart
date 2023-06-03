import 'package:flutter/material.dart';

class DataProfile extends StatelessWidget {
String label;
String content;

DataProfile({Key? key, required this.label,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Row(

        children: [
          Container(
            padding: const EdgeInsets.only(left: 25),
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
