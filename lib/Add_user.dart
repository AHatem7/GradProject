import 'package:flutter/material.dart';
import 'package:untitled2/home/UsersPage.dart';
import 'package:untitled2/textfeild.dart';



class AddUser extends StatelessWidget {
  static const String routeName='Add User';



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [  Image.asset('assets/images/bac.png',
      width: double.infinity,
      fit: BoxFit.fill,),Scaffold(backgroundColor: Colors.transparent,resizeToAvoidBottomInset: false,


        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15 ,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    FloatingActionButton(onPressed: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> UsersPage()));
                    },
                      child: Icon(Icons.arrow_back,color: Colors.black,size: 35),
                      backgroundColor:Colors.white,

                    )],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:150,
                  height: 50,
                  child: TextField(


                    decoration:  InputDecoration(filled: true,fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: BorderSide(width: 0,style: BorderStyle.none)),


                        hintText:'First Name' ,hintStyle: TextStyle(color: Colors.black26, )
                    ),
                  ),

                ), SizedBox(
                  width:150,
                  height: 50,
                  child: TextField(


                    decoration:  InputDecoration(filled: true,fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: BorderSide(width: 0,style: BorderStyle.none)),


                        hintText:'Last Name' ,hintStyle: TextStyle(color: Colors.black26, )
                    ),
                  ),
                )
              ],
            ), SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('ID')
            ],), SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('E-Mail')
            ],), SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Password')
            ],), SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Phone Number')
            ],), SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Department')
            ],),
            Row(children: [

            ],), SizedBox(height: 20,),
            Expanded(

              child:
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [ ElevatedButton(onPressed: (){

                }, child:Text('Submit',style: TextStyle(fontSize: 25)),style: ElevatedButton.styleFrom(fixedSize: Size(200,50),
                    primary: Color.fromRGBO(220, 205, 168, 1),shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.circular(30.0))) ,


                ), ],),
            ),


          ],


        ),

      ),
      ],);
  }
}