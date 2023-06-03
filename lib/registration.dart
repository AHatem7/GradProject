// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:untitled2/backgrounds.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class Registration extends StatefulWidget {
// //   static const String routename = 'Registration';
// //
// //   Registration({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Registration> createState() => _RegistrationState();
// // }
// //
// // class _RegistrationState extends State<Registration> {
// //
// //   var _username, _email, _password;
// //
// //   // late String _username;
// //   // late String _email;
// //   // late String _password;
// //
// //   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
// //
// //   signUp() async {
// //     var formdata = formstate.currentState;
// //     if(formdata!.validate()){
// //       formdata.save();
// //
// //       try {
// //         //showLoading(context);
// //         UserCredential userCredential = await FirebaseAuth.instance
// //             .createUserWithEmailAndPassword(
// //             email: _email, password: _password);
// //         return userCredential;
// //       } on FirebaseAuthException catch (e) {
// //         if (e.code == 'weak-password') {
// //           Navigator.of(context).pop();
// //           // AwesomeDialog(
// //           //     context: context,
// //           //     title: "Error",
// //           //     body: Text("Password is to weak"))
// //           //   ..show();
// //         } else if (e.code == 'email-already-in-use') {
// //           Navigator.of(context).pop();
// //           // AwesomeDialog(
// //           //     context: context,
// //           //     title: "Error",
// //           //     body: Text("The account already exists for that email"))
// //           //   ..show();
// //         }
// //       } catch (e) {
// //         print(e);
// //     }
// //     }
// //     else{
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:
// //       Stack(
// //         children: [
// //           Background('assets/images/RegisterBG.png'),
// //
// //           Column(
// //             children: [
// //               Expanded( flex: 2,
// //                   child: Row(children: const [])),
// //               Expanded(
// //                 child: Row( mainAxisAlignment: MainAxisAlignment.center,
// //                   children: const [
// //                     Text('Welcome',
// //                       style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)],),
// //               ),
// //
// //               Form(
// //                   key: formstate,
// //                   child:
// //                   Column(
// //                     children: [
// //                       Row( mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                             height: 50,
// //                             width: 300,
// //                             key: formstate,
// //                             child:
// //                             TextFormField(
// //                               decoration: InputDecoration( filled: true, fillColor: Colors.white,
// //                                   border: OutlineInputBorder(
// //                                     borderRadius: BorderRadius.circular(18),
// //                                     borderSide: const BorderSide(width: 0, style: BorderStyle.none),),
// //                                   hintText: 'User Name',
// //                                   hintStyle: const TextStyle(color: Colors.black,)),
// //                               //keyboardType: TextInputType.name,
// //                               validator: (value) {
// //                                 if(value!.isEmpty) {
// //                                   return 'Enter User Name Please';
// //                                 }
// //                                 if(value.length<2){
// //                                   return "User Name can't be less than 2";
// //                                 }
// //                                 return null;
// //                               },
// //                               onSaved: (value){
// //                                 _username = value!;
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //
// //                       const SizedBox(height: 20),
// //
// //                       Row( mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                             height: 50,
// //                             width: 300,
// //                             child:
// //                             TextFormField(
// //                               decoration: InputDecoration( filled: true, fillColor: Colors.white,
// //                                   border: OutlineInputBorder(
// //                                     borderRadius: BorderRadius.circular(18),
// //                                     borderSide: const BorderSide(width: 0, style: BorderStyle.none),
// //                                   ),
// //                                   hintText: 'Email',
// //                                   hintStyle: const TextStyle(color: Colors.black,)),
// //                               //keyboardType: TextInputType.emailAddress,
// //                               validator: (value) {
// //                                 if(value!.isEmpty) {
// //                                   return 'Enter email';
// //                                 }
// //                                 if(!value.contains('@')){
// //                                   return 'Please enter a valid email address';
// //                                 }
// //                                 return null;
// //                               },
// //                               onSaved: (value){
// //                                 _email = value!;
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //
// //                       const SizedBox(height: 20),
// //
// //                       Row( mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           SizedBox(
// //                             height: 50,
// //                             width: 300,
// //                             child:
// //                             TextFormField(
// //                               decoration: InputDecoration( filled: true, fillColor: Colors.white,
// //                                   border: OutlineInputBorder(
// //                                     borderRadius: BorderRadius.circular(18),
// //                                     borderSide: const BorderSide(width: 0, style: BorderStyle.none),
// //                                   ),
// //                                   hintText: 'Password',
// //                                   hintStyle: const TextStyle(color: Colors.black
// //                                   )),
// //                               obscureText: true,
// //                               validator: (value) {
// //                                 if(value!.isEmpty) {
// //                                   return 'Enter password';
// //                                 }
// //                                 if(value.length < 6){
// //                                   return 'Please enter a  password';
// //                                 }
// //                                 return null;
// //                               },
// //                               onSaved: (value){
// //                                 _password = value!;
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       // TextButton(onPressed: (){}, child: const Text('Forget your password?',
// //                       //   style: TextStyle(color: Colors.black26),)),
// //
// //                       const SizedBox(height:50),
// //                       ElevatedButton(onPressed: () async{
// //                         UserCredential response = await signUp();
// //                         print("===================");
// //                         if(response != null){
// //                           await FirebaseFirestore.instance
// //                               .collection("user").add({"username": _username, "email": _email});
// //                           Navigator.of(context).pushReplacementNamed('Login');
// //                         } else{
// //                           print('Sign In Faild');
// //                         }
// //                         // if(_formKey.currentState!.validate()){
// //                         //   _formKey.currentState!.save();
// //                         //   print('Email: $_email, Password $_password');
// //                         // }
// //                         //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
// //                       },
// //                           style: ElevatedButton.styleFrom(
// //                               backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
// //                               fixedSize: const Size(300, 50),
// //                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
// //                           child: const Text('Sign Up')),
// //                     ],
// //                   )
// //               ),
// //               Expanded( flex: 2,
// //                   child: Row(children: const [],))
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// // ////////////////////////////////////////////////////////////////////////////////////////////////////////////
// //
// //
// // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // //import 'package:course_flutter/component/alert.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:untitled2/backgrounds.dart';
// // // //
// // // // class SignUp extends StatefulWidget {
// // // //   static String routename = 'SignUp';
// // // //   SignUp({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   _SignUpState createState() => _SignUpState();
// // // // }
// // // //
// // // // class _SignUpState extends State<SignUp> {
// // // //   var myusername, mypassword, myemail;
// // // //   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
// // // //
// // // //   signUp() async {
// // // //     var formdata = formstate.currentState;
// // // //     if (formdata!.validate()) {
// // // //       formdata.save();
// // // //
// // // //       try {
// // // //         //showLoading(context);
// // // //         UserCredential userCredential = await FirebaseAuth.instance
// // // //             .createUserWithEmailAndPassword(
// // // //             email: myemail, password: mypassword);
// // // //         return userCredential;
// // // //       } on FirebaseAuthException catch (e) {
// // // //         if (e.code == 'weak-password') {
// // // //           Navigator.of(context).pop();
// // // //           AwesomeDialog(
// // // //               context: context,
// // // //               title: "Error",
// // // //               body: const Text("Password is to weak"))
// // // //             .show();
// // // //         } else if (e.code == 'email-already-in-use') {
// // // //           Navigator.of(context).pop();
// // // //           AwesomeDialog(
// // // //               context: context,
// // // //               title: "Error",
// // // //               body: const Text("The account already exists for that email"))
// // // //             .show();
// // // //         }
// // // //       } catch (e) {
// // // //         print(e);
// // // //       }
// // // //     } else {}
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       resizeToAvoidBottomInset: false,
// // // //       body: Stack(
// // // //         children: [
// // // //           Background('assets/images/RegisterBG.png'),
// // // //           Column(
// // // //             children: [
// // // //               Expanded(child: Row(children: const [],)),
// // // //               Expanded(
// // // //                 child: Row( mainAxisAlignment: MainAxisAlignment.center,
// // // //                   children: const [
// // // //                     Text('Welcome',
// // // //                     style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //               Form(
// // // //                   key: formstate,
// // // //                   child: Column(
// // // //                     children: [
// // // //                       SizedBox(
// // // //                         height: 50,
// // // //                         width: 300,
// // // //                         child: TextFormField(
// // // //                           onSaved: (val) {
// // // //                             myusername = val;
// // // //                           },
// // // //                           validator: (val) {
// // // //                             if (val!.length > 100) {
// // // //                               return "username can't to be larger than 100 letter";
// // // //                             }
// // // //                             if (val.length < 2) {
// // // //                               return "username can't to be less than 2 letter";
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                           decoration: InputDecoration(
// // // //                             filled: true, fillColor: Colors.white,
// // // //                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(18),
// // // //                             borderSide: const BorderSide(width: 0,style: BorderStyle.none)),
// // // //                             prefixIcon: const Icon(Icons.person),
// // // //                             hintText: "User Name",
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 20),
// // // //                       SizedBox(
// // // //                         height: 50,
// // // //                         width: 300,
// // // //                         child: TextFormField(
// // // //                           onSaved: (val) {
// // // //                             myemail = val;
// // // //                           },
// // // //                           validator: (val) {
// // // //                             if (val!.length > 100) {
// // // //                               return "Email can't to be larger than 100 letter";
// // // //                             }
// // // //                             if (val.length < 2) {
// // // //                               return "Email can't to be less than 2 letter";
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                           decoration: InputDecoration(
// // // //                             filled: true,fillColor: Colors.white,
// // // //                               prefixIcon: const Icon(Icons.person),
// // // //                               hintText: "email",
// // // //                               border: OutlineInputBorder(
// // // //                                   borderRadius: BorderRadius.circular(18),
// // // //                                   borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 20),
// // // //                       SizedBox(
// // // //                         height: 50,
// // // //                         width: 300,
// // // //                         child: TextFormField(
// // // //                           onSaved: (val) {
// // // //                             mypassword = val;
// // // //                           },
// // // //                           validator: (val) {
// // // //                             if (val!.length > 100) {
// // // //                               return "Password can't to be larger than 100 letter";
// // // //                             }
// // // //                             if (val.length < 4) {
// // // //                               return "Password can't to be less than 4 letter";
// // // //                             }
// // // //                             return null;
// // // //                           },
// // // //                           obscureText: true,
// // // //                           decoration: InputDecoration(
// // // //                               filled: true, fillColor: Colors.white,
// // // //                               prefixIcon: const Icon(Icons.person),
// // // //                               hintText: "password",
// // // //                               border: OutlineInputBorder(
// // // //                                   borderRadius: BorderRadius.circular(18),
// // // //                                   borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 30,),
// // // //                       Container(
// // // //                           margin: const EdgeInsets.all(10),
// // // //                           child:
// // // //                           // Row(
// // // //                           //   children: [
// // // //                           //     const Text("if you have Account "),
// // // //                           //     InkWell(
// // // //                           //       onTap: () {
// // // //                           //         Navigator.of(context).pushNamed("login");
// // // //                           //       },
// // // //                           //       child: const Text(
// // // //                           //         "Click Here",
// // // //                           //         style: TextStyle(color: Colors.blue),
// // // //                           //       ),
// // // //                           //     )
// // // //                           //   ],
// // // //                           // )),
// // // //                           Container(
// // // //                               child: ElevatedButton(
// // // //                                 // textColor: Colors.white,
// // // //
// // // //                                 onPressed: () async {
// // // //                                   UserCredential response = await signUp();
// // // //                                   print("===================");
// // // //                                   if (response != null) {
// // // //                                     await FirebaseFirestore.instance
// // // //                                         .collection("users")
// // // //                                         .add({"username": myusername, "email": myemail});
// // // //                                     Navigator.of(context)
// // // //                                         .pushReplacementNamed("LoginPage");
// // // //                                   } else {
// // // //                                     print("Sign Up Faild");
// // // //                                   }
// // // //                                   print("===================");
// // // //                                 },
// // // //                                 style: ElevatedButton.styleFrom(
// // // //                                     backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
// // // //                                     fixedSize: const Size(300, 50),
// // // //                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
// // // //                                 ),
// // // //                                 child: Text(
// // // //                                   "Sign Up",
// // // //                                   style: Theme.of(context).textTheme.headline6,
// // // //                                 ),
// // // //                               )
// // // //                           ),
// // // //                       ),
// // // //                     ],
// // // //                   )
// // // //               ),
// // // //               Expanded(child: Row(children: const [],))
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //






// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class SignUpScreen extends StatefulWidget {
//   static String routename = 'signin';
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//
//   Future<void> _signUp() async {
//     final formState = _formKey.currentState;
//     if (formState!.validate()) {
//       formState.save();
//       try {
//         final UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: _email, password: _password);
//         // Do something with the user object
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           print('The password provided is too weak.');
//         } else if (e.code == 'email-already-in-use') {
//           print('The account already exists for that email.');
//         }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _email = value!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _password = value!,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: _signUp,
//                   child: Text('Sign Up'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // //
// // //
// // //





////////////////////////////////////////////////////////////////////////////



// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:course_flutter/component/alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'alert.dart';
// import 'loading.dart';
// import 'main.dart';
//
// class SignUp extends StatefulWidget {
//   static String routename = 'SignUpScreen';
//   // SignUp({Key key}) : super(key: key);
//
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   var myusername, mypassword, myemail;
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//
//   signUp() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();
//
//       try {
//         //showLoading(context);
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//             email: myemail, password: mypassword);
//         return userCredential;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("Password is to weak"))
//             ..show();
//         } else if (e.code == 'email-already-in-use') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("The account already exists for that email"))
//             ..show();
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {}
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           SizedBox(height: 100),
//           Center(child:
//           Container(
//             padding: EdgeInsets.all(20),
//             child: Form(
//                 key: formstate,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       onSaved: (val) {
//                         myusername = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "username can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "username can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "username",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       onSaved: (val) {
//                         myemail = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Email can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "Email can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "email",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       onSaved: (val) {
//                         mypassword = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Password can't to be larger than 100 letter";
//                         }
//                         if (val.length < 4) {
//                           return "Password can't to be less than 4 letter";
//                         }
//                         return null;
//                       },
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "password",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     Container(
//                         margin: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Text("if you have Account "),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pushNamed("login");
//                               },
//                               child: Text(
//                                 "Click Here",
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             )
//                           ],
//                         )),
//                     Container(
//                         child: ElevatedButton(
//                           // textColor: Colors.white,
//                           onPressed: () async {
//                             UserCredential response = await signUp();
//                             print("===================");
//                             if (response != null) {
//                               await FirebaseFirestore.instance
//                                   .collection("users")
//                                   .add({"username": myusername, "email": myemail});
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
//                             } else {
//                               print("Sign Up Faild");
//                             }
//                             print("===================");
//                           },
//                           child: Text(
//                             "Sign Up",
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                         ))
//                   ],
//                 )),
//           )
//           ),
//         ],
//       ),
//     );
//   }
// }



//////////////////////////////////////////////// // //


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage1 extends StatefulWidget {
//   static String routename = 'Login1';
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage1> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String _email, _password;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             TextFormField(
//               validator: (input) {
//                 if (input!.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 return null;
//               },
//               onSaved: (input) => _email = input!,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextFormField(
//               validator: (input) {
//                 if (input!.length < 6) {
//                   return 'Your password needs to be at least 6 characters';
//                 }
//                 return null;
//               },
//               onSaved: (input) => _password = input!,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState?.save();
//                   // if (user != null) {
//                   //   Navigator.of(context)
//                   //       .pushReplacementNamed("homepage");
//                   // }
//
//                   // Here you can implement the authentication logic
//                   // For example, you can make an API request to verify the email and password
//                 }
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// //



// // ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// //


//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'loading.dart';
//
// class SignUp extends StatefulWidget {
//   static String routename = 'SignUp';
//   const SignUp({Key? key}) : super(key: key);
//
//
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final auth = FirebaseAuth.instance;
//   var showpass = true;
//   late String email;
//   late String password;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(
//                     hintText: 'Email',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))
//                 ),
//               ),
//               SizedBox(height: 40,),
//
//               TextFormField(
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 obscureText: showpass,
//                 decoration: InputDecoration(
//                    suffixIcon: IconButton(onPressed: (){
//                      setState(() {
//                        showpass = false;
//                      });
//                    },
//                        icon: Icon(Icons.password)
//                    ),
//                     hintText: 'PassWord',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(40),
//                   )
//                 ),
//               ),
//
//               SizedBox(height: 20,),
//               ElevatedButton(onPressed: () async {
//                 // print(email);
//                 // print(password);
//                 try{
//                   var user = await auth.createUserWithEmailAndPassword(
//                       email: email, password: password);
//                   showMessage(context, 'task added successfully',
//                       posActionName: 'ok',posActionCallBack: (){
//                         Navigator.pop(context);
//                       });
//
//                 } catch (e) {
//                   print(e);
//
//                 }
//               },
//                   child: Text('Sign Up'))
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////////////////


//*****************************************************************************MOHAMMED NABIL CODE**************************************************
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled2/backgrounds.dart';
// import 'package:untitled2/register_view_model.dart';
// import 'base.dart';
// class register extends StatefulWidget {
//
//   static const String routename='register';
//
//   @override
//   State<register> createState() => _registerState();
// }
//
// class _registerState extends BaseState<register,RegisterViewModel>  {
//
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//
//  // RegisterViewModel ViewModel = RegisterViewModel();
//   String firstname='';
//
//   String lastname='';
//
//   String email='';
//
//   String password  ='';
//
//   String phone ='';
//
//   String department ='';
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     viewModel.navigator = this;
//   }
//
//   // var isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => viewModel,
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
//                     key: formKey,
//                     child:
//                     Column(
//                       children: [
//                         Row( mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               width: 300,
//                               child: TextFormField(
//
//                                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(18),
//                                       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                     ),
//                                     hintText: 'firstName',
//                                     hintStyle: const TextStyle(color: Colors.black,)),
//                                 onChanged: (value){
//                                   firstname = value;
//                                 },
//                                 validator: (value) {
//                                   if(value == null || value!.trim().isEmpty) {
//                                     return 'firstName';
//                                   }
//                                   return null;
//                                 },
//                               ),
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
//                               child: TextFormField(
//                                 decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(18),
//                                       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                     ),
//                                     hintText: 'lastName',
//                                     hintStyle: const TextStyle(color: Colors.black
//                                     )),
//                                 onChanged: (value){
//                                   lastname = value;
//                                 },
//                                 validator: (value) {
//                                   if(value == null || value!.trim().isEmpty) {
//                                     return 'lastName';
//                                   }
//
//                                   return null;
//                                 },
//                               ),
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
//                         TextFormField(
//                           decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                                 borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               ),
//                               hintText: 'phone',
//                               hintStyle: const TextStyle(color: Colors.black
//                               )),
//                           onChanged: (value){
//                             phone = value;
//                           },
//                           validator: (value) {
//                             if(value == null || value!.trim().isEmpty) {
//                               return 'phone';
//                             }
//
//                             return null;
//                           },
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                                 borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                               ),
//                               hintText: 'department',
//                               hintStyle: const TextStyle(color: Colors.black
//                               )),
//                           onChanged: (value){
//                             department = value;
//                           },
//                           validator: (value) {
//                             if(value == null || value!.trim().isEmpty) {
//                               return 'department';
//                             }
//
//                             return null;
//                           },
//                         ),
//
//                         TextButton(onPressed: (){}, child: const Text('Forget your password?',
//                           style: TextStyle(color: Colors.black26),)),
//                         ElevatedButton(onPressed: (){
//                           validateForm();
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
//     );
//   }
//
//   void validateForm(){
//     if(formKey.currentState?.validate() == true){
//       viewModel.register(email,password,firstname,lastname,phone,department);
//
//     }
//   }
//
//
//
//   @override
//   RegisterViewModel initViewModel() {
//
//     return RegisterViewModel();
//   }
// }








