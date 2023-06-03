// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled2/base.dart';
// import 'package:untitled2/login/Navigator_viewModel.dart';
// import 'package:untitled2/login/loginViewMOdel.dart';
//
// import '../backgrounds.dart';
// import '../home/BottomNavigationBarItem.dart';
//
// class Login22 extends StatefulWidget {
//   static const routename = 'login22';
//   const Login22({Key? key}) : super(key: key);
//
//   @override
//   State<Login22> createState() => _Login22State();
// }
//
// class _Login22State extends BaseState <Login22, LoginViewModel>
// implements LoginNavigator{
// @override
//
//   LoginViewModel initViewModel() {
//    return LoginViewModel();
//   }
//
//   @override
//   void initState() {
//
//     super.initState();
//     viewModel.navigator=this;
//
//   }
//   String email='';
// String password='';
// // String firstName='';
// // String lastName='';
// // String userName='';
//
// var formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<LoginViewModel>(
//       create:  (_) => viewModel,
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           children: [
//             Background('assets/images/login2.jpeg'),
//
//             Column(
//               children: [
//                 Expanded( flex: 2,
//                     child: Row(children: const [])),
//                 Row( mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text('Welcome',
//                       style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)],),
//
//                 const SizedBox(height: 15 ,),
//
//                 Form(
//                     key: formkey,
//                     child:
//                     Column(
//                       children: [
//                         Row( mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               width: 300,
//                               // child: TextFormField(
//                               //
//                               //   decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               //       border: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(18),
//                               //         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               //       ),
//                               //       hintText: 'firstName',
//                               //       hintStyle: const TextStyle(color: Colors.black,)),
//                               //   onChanged: (value){
//                               //     firstname = value;
//                               //   },
//                               //   validator: (value) {
//                               //     if(value == null || value!.trim().isEmpty) {
//                               //       return 'firstName';
//                               //     }
//                               //     return null;
//                               //   },
//                               // ),
//                             ),
//                           ],
//                         ),
//
//                         const SizedBox(height: 20),
//
//                         Row( mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               width: 300,
//                               // child: TextFormField(
//                               //   decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               //       border: OutlineInputBorder(
//                               //         borderRadius: BorderRadius.circular(18),
//                               //         borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               //       ),
//                               //       hintText: 'lastName',
//                               //       hintStyle: const TextStyle(color: Colors.black
//                               //       )),
//                               //   onChanged: (value){
//                               //     lastname = value;
//                               //   },
//                               //   validator: (value) {
//                               //     if(value == null || value!.trim().isEmpty) {
//                               //       return 'lastName';
//                               //     }
//                               //
//                               //     return null;
//                               //   },
//                               // ),
//                             ),
//                           ],
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                                 borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               ),
//                               hintText: 'email',
//                               hintStyle: const TextStyle(color: Colors.black)
//                           ),
//                           onChanged: (value){
//                             email = value;
//                           },
//                           validator: (value) {
//                             if(value == null || value!.trim().isEmpty) {
//                               return 'email';
//                             }
//                             return null;
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                                 borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               ),
//                               hintText: 'Password',
//                               hintStyle: const TextStyle(color: Colors.black
//                               )),
//                           onChanged: (value){
//                             password = value;
//                           },
//                           validator: (value) {
//                             if(value == null || value!.trim().isEmpty) {
//                               return 'Enter Password';
//                             }
//                             if(value.trim().length<6){
//                               return 'Password should be at least 6 char';
//                             }
//                             return null;
//                           },
//                         ),
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
//                         TextButton(onPressed: (){}, child: const Text('Forget your password?',
//                           style: TextStyle(color: Colors.black26),)),
//                         ElevatedButton(onPressed: (){
//                          validateForm();
//                           //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
//                         },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
//                                 fixedSize: const Size(300, 50),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//                             child: const Text('Login')
//                         ),
//                       ],
//                     )
//                 ),
//                 Expanded( flex: 2,
//                     child: Row(children: const [],))
//
//               ],
//             ),
//           ],
//         ),
//       ),
//    );
//   }
//  void validateForm(){
//     if(formkey.currentState?.validate()==true){
//       viewModel.login(email,password
//
//           );
//     }
//  }
//
//  @override
//   void gotoHome() {
//     hideDialog();
//     Navigator.of(context).pushReplacementNamed(DirectoryPage.routename);
//   }
//
// }
