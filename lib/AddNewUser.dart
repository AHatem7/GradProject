import 'package:flutter/material.dart';
import 'package:untitled2/home/UsersPage.dart';

import 'backgrounds.dart';
import 'login/LoginHelper.dart';

class ADDUser extends StatelessWidget {
  static String routename ='ADDUser';
  AuthService authService= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background('assets/images/BG1.png'),

          Column(
            children: [
              // Expanded( flex: 2,
              //     child: Row(children: const [])),
              Expanded(flex: 2,
                child: Row(
                  children: [Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    FloatingActionButton(onPressed: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> UsersPage()));

                    },
                      child: Icon(Icons.arrow_back, color: Colors.black,size: 35),
                      backgroundColor: Colors.white,)
                  ],
                ),
              ),

              const SizedBox(height: 15 ,),

              Expanded(flex: 6,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    const SizedBox(height: 20),


                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 55,width: 160,
                          child: TextFormField(
                            controller: authService.firstname,
                            decoration: InputDecoration( filled: true, fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                                ),
                                hintText: 'firstname',
                                hintStyle: const TextStyle(color: Colors.black)
                            ),

                          ),
                        ),
                        SizedBox(width: 25,),
                        SizedBox(width: 160,height: 55,
                          child: TextFormField(
                            controller: authService.lastname,
                            decoration: InputDecoration( filled: true, fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                                ),
                                hintText: 'lastname',
                                hintStyle: const TextStyle(color: Colors.black)
                            ),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 55, width: 350,
                      child: TextFormField(
                        controller: authService.email,
                        decoration: InputDecoration( filled: true, fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: 'email',
                            hintStyle: const TextStyle(color: Colors.black)
                        ),

                      ),
                    ),
                    SizedBox(width: 350,height: 55,
                      child: TextFormField(
                        controller: authService.password,
                        decoration: InputDecoration( filled: true, fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.black
                            )),

                      ),
                    ),
                    SizedBox(height: 55,width: 350,
                      child: TextFormField(
                        controller: authService.phone,
                        decoration: InputDecoration( filled: true, fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: 'phone',
                            hintStyle: const TextStyle(color: Colors.black)
                        ),

                      ),
                    ),

                    SizedBox( height: 55,width: 350,
                      child: TextFormField(
                        controller: authService.department,
                        decoration: InputDecoration( filled: true, fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: 'department',
                            hintStyle: const TextStyle(color: Colors.black)
                        ),

                      ),
                    ),


                    SizedBox( height: 55,width: 350,
                      child:

                      TextFormField(
                        controller: authService.role,
                        decoration: InputDecoration( filled: true, fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            hintText: 'Role',
                            hintStyle: const TextStyle(color: Colors.black)
                        ),

                      ),
                    ),

                    SizedBox(height: 35,),



                    ElevatedButton(onPressed: (){
                      //validateForm();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
                      if (authService.email !=""&&authService.password !="")
                      {
                        authService.hendiregester(context);
                      }
                    },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
                            fixedSize: const Size(350, 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                        child: const Text('Add User')
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(children: const [],))

            ],
          ),
        ],
      ),
    );
  }
}