import 'package:flutter/material.dart';



class NamesIds extends StatelessWidget {
String Name;
int Id;
String Email;
int phone;
String department;

NamesIds({Key? key,  this.Name='', this.Id=0, this.Email='',this.phone=0, this.department=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
