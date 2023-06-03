// import 'package:flutter/material.dart';
// import 'package:untitled2/USER/UserHelper.dart';
// import '../backgrounds.dart';
//
//
//
// class UserLoginPage extends StatefulWidget {
//
//
//   //const LoGinPage({Key? key}) : super(key: key);
//   static String routename ='LoGinPage';
//
//
//   @override
//   _UserLoginPageState createState() => _UserLoginPageState();
// }
// useehelper authService= useehelper();
// class _UserLoginPageState extends State<UserLoginPage> {
//
//   //GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   //late String _email;
//   //late String _password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Background('assets/images/login2.jpeg'),
//
//           Column(
//             children: [
//               Expanded( flex: 3,
//                   child:
//                   Row(children: const [])),
//               Expanded(flex: 4,
//                 child: Row( mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text('Welcome',
//                       style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)],),
//               ),
//
//               //const SizedBox(height: 15 ,),
//
//               Expanded(flex: 9,
//                 child: Form(
//                   //key: formKey,
//                     child:
//                     Column(
//                       children: [
//                         // Row( mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     SizedBox(
//                         //       height: 50,
//                         //       width: 300,
//                         //       // child: TextFormField(
//                         //       //
//                         //       //   decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                         //       //       border: OutlineInputBorder(
//                         //       //         borderRadius: BorderRadius.circular(18),
//                         //       //         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                         //       //       ),
//                         //       //       hintText: 'firstName',
//                         //       //       hintStyle: const TextStyle(color: Colors.black,)),
//                         //       //   onChanged: (value){
//                         //       //     firstname = value;
//                         //       //   },
//                         //       //   validator: (value) {
//                         //       //     if(value == null || value!.trim().isEmpty) {
//                         //       //       return 'firstName';
//                         //       //     }
//                         //       //     return null;
//                         //       //   },
//                         //       // ),
//                         //     ),
//                         //   ],
//                         // ),
//
//                         // const SizedBox(height: 20),
//
//                         // Row( mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     SizedBox(
//                         //       height: 50,
//                         //       width: 300,
//                         //       // child: TextFormField(
//                         //       //   decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                         //       //       border: OutlineInputBorder(
//                         //       //         borderRadius: BorderRadius.circular(18),
//                         //       //         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                         //       //       ),
//                         //       //       hintText: 'lastName',
//                         //       //       hintStyle: const TextStyle(color: Colors.black
//                         //       //       )),
//                         //       //   onChanged: (value){
//                         //       //     lastname = value;
//                         //       //   },
//                         //       //   validator: (value) {
//                         //       //     if(value == null || value!.trim().isEmpty) {
//                         //       //       return 'lastName';
//                         //       //     }
//                         //       //
//                         //       //     return null;
//                         //       //   },
//                         //       // ),
//                         //     ),
//                         //   ],
//                         // ),
//                         SizedBox(width: 350,height: 55,
//                           child: TextFormField(
//                             controller: authService.email,
//                             decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(18),
//                                   borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                 ),
//                                 hintText: 'email',
//                                 hintStyle: const TextStyle(color: Colors.black)
//                             ),
//                             // onChanged: (value){
//                             //   _email = value;
//                             // },
//                             // validator: (value) {
//                             //   if(value == null || value!.trim().isEmpty) {
//                             //     return 'email';
//                             //   }
//                             //   return null;
//                             // },
//                           ),
//
//                         ),SizedBox(height: 15,),
//                         SizedBox(height: 55,width: 350,
//                           child: TextFormField(
//                             obscureText: true,
//                             controller: authService.password,
//                             decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(18),
//                                   borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                 ),
//                                 hintText: 'Password',
//                                 hintStyle: const TextStyle(color: Colors.black
//                                 )
//                             ),
//                             // onChanged: (value){
//                             //   _password = value;
//                             // },
//                             // validator: (value) {
//                             //   if(value == null || value!.trim().isEmpty) {
//                             //     return 'Enter Password';
//                             //   }
//                             //   if(value.trim().length<6){
//                             //     return 'Password should be at least 6 char';
//                             //   }
//                             //   return null;
//                             // },
//                           ),
//                         ),SizedBox(height: 30,),
//
//
//                         // TextFormField(
//                         //   decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                         //       border: OutlineInputBorder(
//                         //         borderRadius: BorderRadius.circular(18),
//                         //         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                         //       ),
//                         //       hintText: 'userName',
//                         //       hintStyle: const TextStyle(color: Colors.black
//                         //       )),
//                         //   onChanged: (value){
//                         //     username = value;
//                         //   },
//                         //   validator: (value) {
//                         //     if(value == null || value!.trim().isEmpty) {
//                         //       return 'userName';
//                         //     }
//                         //
//                         //     return null;
//                         //   },
//                         // ),
//                         // TextButton(onPressed: (){}, child: const Text('Forget your password?',
//                         //   style: TextStyle(color: Colors.black26),)),
//                         ElevatedButton(onPressed: (){
//                           //validateForm();
//                           //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
//                           if (authService.email !=""&&authService.password !="")
//                           {
//                             authService.usernav(context);
//                           }
//                         },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
//                                 fixedSize: const Size(350, 50),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//                             child: const Text('Login')
//                         ),
//                       ],
//                     )
//                 ),
//               ),
//               // Expanded( flex: 2,
//               //     child: Row(children: const [],))
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }