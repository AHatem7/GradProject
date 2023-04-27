import 'package:flutter/material.dart';
import 'package:untitled2/home/usercards.dart';
import 'package:untitled2/requestcard.dart';

class RequestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [

                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 620,
          child: ListView(children: [
            ReqestCard(name: 'Lojain Amr',id: '89504', message: "Want to access 'this file'",),
            ReqestCard(name: 'Salma Abdelrazek',id: '89575', message: "Want to access 'this file'",),
            ReqestCard(name: 'Sohaila Mohamed',id: '89459', message: "Want to access 'this file'",),
            ReqestCard(name: 'Hesham Saleh',id: '89581', message: "Want to access 'this file'",),
            ReqestCard(name: 'Nouran Ashraf',id: '89550', message: "Want to access 'this file'",),


          ]),)

      ],);
  }
}
