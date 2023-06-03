import 'package:flutter/material.dart';
import 'package:untitled2/home/UsersPage.dart';
import 'package:untitled2/textfeild.dart';



class AddUser extends StatelessWidget {
  static const String routeName='Add User';

  const AddUser({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [  Image.asset('assets/images/bac.png',
      width: double.infinity,
      fit: BoxFit.fill,),Scaffold(backgroundColor: Colors.transparent,resizeToAvoidBottomInset: false,


        body: Column(mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const SizedBox(
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
                      child: const Icon(Icons.arrow_back,color: Colors.black,size: 35),
                      backgroundColor:Colors.white,

                    )
                  ],
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
                            borderSide: const BorderSide(width: 0,style: BorderStyle.none)),


                        hintText:'First Name' ,hintStyle: const TextStyle(color: Colors.black26, )
                    ),
                  ),

                ), SizedBox(
                  width:150,
                  height: 50,
                  child: TextField(


                    decoration:  InputDecoration(filled: true,fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(width: 0,style: BorderStyle.none)),


                        hintText:'Last Name' ,hintStyle: const TextStyle(color: Colors.black26, )
                    ),
                  ),
                )
              ],
            ), const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('ID')
            ],), const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('E-Mail')
            ],), const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Password')
            ],), const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Phone Number')
            ],), const SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Textting('Department')
            ],),
            Row(children: const []),
            const SizedBox(height: 20,),
            Expanded(

              child:
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [ ElevatedButton(onPressed: (){

                }, child:const Text('Submit',style: TextStyle(fontSize: 25)),style: ElevatedButton.styleFrom(fixedSize: const Size(200,50),
                    primary: const Color.fromRGBO(220, 205, 168, 1),shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.circular(30.0))) ,


                ), ],),
            ),


          ],


        ),

      ),
      ],);
  }
}