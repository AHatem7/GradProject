import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'Departments.dart';
import 'drop_bottom.dart';


class UploadFile extends StatefulWidget {
  static const String routename = 'UploadFile';

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  List<String> items = ['Department 1', 'Departement 2', 'Department 3','Departement 4'];

  String? selectedItem = 'Departement 1';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bac.png',
          width: double.infinity,
          fit: BoxFit.fill,),

        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,

          body: Column(
            children: [Padding(padding: EdgeInsets.symmetric(vertical: 25)),

              Row(
                children: [Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  FloatingActionButton(onPressed: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=> Departments()));

                  },
                    child: Icon(Icons.arrow_back, color: Colors.black,size: 35),
                    backgroundColor: Colors.white,)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Opacity(
                opacity: 0.5,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child:
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            child:
                            Column( mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload_outlined, size: 100,),
                                Text('Upload')
                              ],
                            ),
                            width: 341,
                            height: 341,

                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            ),

                          ),

                        ),

                      )
                    ],
                  ),

                ),
              ),

              // Center(
              //   child: DropdownButton<String>(
              //     value: selectedItem,
              //     items : items
              //         .map((item) => DropdownMenuItem<String>(
              //       value: item,
              //       child: Text(item, style: TextStyle(fontSize: 24)),
              //     ))
              //         .toList(),
              //     onChanged: (item) => setState(() => selectedItem = item),
              //
              //   ),
              // ),

              SizedBox(
                height: 20,
              ),DropDownButton(),

              SizedBox(
                width: 312,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration:
                      InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),

                    TextField(
                      decoration:
                      InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Describtion',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){},
                child: Text('Submit',style:TextStyle(fontSize: 25,),),


                style: ElevatedButton.styleFrom(fixedSize: Size(200,50),
                    primary: Color.fromRGBO(220, 205, 168, 1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
                )),
              ),


            ],
          ),
        )

      ],
    );
  }
}