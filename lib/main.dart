import 'package:flutter/material.dart';
import 'package:untitled2/Add_user.dart';
import 'package:untitled2/Departments.dart';
import 'package:untitled2/choose/choose.dart';
import 'package:untitled2/editviewuser.dart';
import 'package:untitled2/home/BottomNavigationBarItem.dart';
import 'package:untitled2/backgrounds.dart';
import 'package:untitled2/home/ProfilePage.dart';
import 'package:untitled2/profilepage_edit.dart';
import 'package:untitled2/myTheme.dart';
import 'package:untitled2/registration.dart';
import 'package:untitled2/testUploadFileDB.dart';
import 'package:untitled2/uplode_file.dart';
import 'package:untitled2/viewPDF.dart';
import 'package:untitled2/view_file.dart';
import 'package:untitled2/viewuser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AddNewUser.dart';
import 'USER/UserLOginPage.dart';
import 'USER/chatpageUser.dart';
import 'USER/homePage.dart';
import 'USER/profileuser.dart';
import 'getdatatest.dart';
import 'home/chatpage.dart';
import 'login/LoGinPage.dart';
import 'login/loginScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'grad',
      debugShowCheckedModeBanner: false,
      routes: {
      //LoginPage.routename:(context) => LoginPage(),
        DirectoryPage.routename:(context) => const DirectoryPage(),
        //Profile_Edit.routename:(context) => const Profile_Edit(),
        ProfilePage.routename :(context) => ProfilePage(),
        ViewUser.routename: (context) => const ViewUser(),
        EditViewUser.routename: (context) => const EditViewUser(),
        AddUser.routeName:(context) => const AddUser(),
        Departments.routename:(context) => const Departments(),
        UploadFile.routename:(context) => UploadFile(),
        //AddTaskBottomSheet.routename:(context) => AddTaskBottomSheet(),
        // Registration.routename:(context) => Registration(),
        //SignUp.routename:(context) => SignUp(),
        //SignUpScreen.routename:(context) => SignUpScreen(),
        //LoginPage1.routename:(context) => LoginPage1(),
        //Test.routename:(context) => Test(),
        //register.routename:(context) => register(),
        //Login22.routename:(context) => Login22(),
        testUploadDB.routename:(context) => testUploadDB(),
        //testup.routename:(context) => testup(),
        //MyHomePage.routename:(context) => MyHomePage(),
        //FirebaseStorageListView.routename:(context) => FirebaseStorageListView(),
        LoGinPage.routename:(context) => LoGinPage(),
        AddUser.routeName:(context) => ADDUser(),
        UserHomePage.routename: (context) => UserHomePage(),
       // UserLoginPage.routename:(context) => UserLoginPage(),
       // Choose.routename:(context) => Choose(),
        //viewfile.routename:(context) => viewfile(),
        ViewPDF.routename:(context) => ViewPDF(),
        ProfilePageUser1.routename:(context) => ProfilePageUser1(),
        chatpage.routename:(context) => chatpage(email: '',),
        chatpageuser.routename:(context) => chatpageuser(email: '',),
        ADDUser.routename:(context) => ADDUser(),




      },
      initialRoute: LoGinPage.routename,
      theme: MyThemeData.Lighttheme,

    );
  }
}

// class LoginPage extends StatelessWidget {
// static const String routename='login page';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//
//       body: Stack(children: [
//         Background('assets/images/login2.jpeg'),
//         Column(children: [
//           Expanded(flex: 2,
//             child: Row(
//                 children: [
//
//
//                 ]),
//           ),
//
//           Expanded(flex: 3,
//             child: Column(
//               children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [Text('Welcome',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),],),
//                 Spacer(),
//
//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Textting('E-mail'),],
//                 ),Spacer(),
//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Textting('password'),],
//                 ),Spacer(),
//                 TextButton(onPressed: (){}, child: Text('Forget your password?',
//                 style: TextStyle(color: Colors.black26),)),
//                 Spacer(),
//               ElevatedButton(onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=> DirectoryPage()));
//
//               },
//                   style: ElevatedButton.styleFrom(
//                       primary: Color.fromRGBO(220, 205, 168, 1),
//                       fixedSize: Size(300, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//
//                   child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
//                 Spacer(),
//
//               ],
//             ),
//           ),
//
//           Expanded(flex: 2,
//             child: Row(
//                 children: []),
//           ),
//         ],)
//      ] )
//
//       );
//
//   }
// }


////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////***********************************Login UI******************************************************************

// class LoginPage extends StatelessWidget {
//   static const String routename='login page';
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   late String _email;
//   late String _password;
//
//   LoginPage({Key? key}) : super(key: key);
//
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
//               Expanded( flex: 2,
//                   child: Row(children: const [])),
//               Row( mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text('Welcome',
//                     style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)],),
//
//               const SizedBox(height: 15 ,),
//
//               Form(
//                   key: formKey,
//                   child:
//                   Column(
//                     children: [
//                       Row( mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 50,
//                             width: 300,
//                             child: TextFormField(
//
//                               decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                   ),
//                                   hintText: 'Email',
//                                   hintStyle: const TextStyle(color: Colors.black,)),
//                               validator: (value) {
//                                 if(value == null || value!.trim().isEmpty) {
//                                   return 'Enter email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 20),
//
//                       Row( mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 50,
//                             width: 300,
//                             child: TextFormField(
//                               decoration: InputDecoration( filled: true, fillColor: Colors.white,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(18),
//                                     borderSide: const BorderSide(width: 0, style: BorderStyle.none),
//                                   ),
//                                   hintText: 'Password',
//                                   hintStyle: const TextStyle(color: Colors.black
//                                   )),
//                               validator: (value) {
//                                 if(value == null || value!.trim().isEmpty) {
//                                   return 'Enter Password';
//                                 }
//                                 if(value.trim().length<6){
//                                   return 'Password should be at least 6 char';
//                                 }
//                                 return null;
//                               },
//
//                             ),
//                           ),
//                         ],
//                       ),
//                       TextButton(onPressed: (){}, child: const Text('Forget your password?',
//                         style: TextStyle(color: Colors.black26),)),
//                       ElevatedButton(onPressed: (){
//                         validateForm();
//                         //Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
//                       },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color.fromRGBO(220, 205, 168, 1),
//                               fixedSize: const Size(300, 50),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
//                           child: const Text('Login')
//                       ),
//                     ],
//                   )
//               ),
//               Expanded( flex: 2,
//                   child: Row(children: const [],))
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   void validateForm(){
//     if(formKey.currentState?.validate() == true){
//     //  createAccount
//     //   try {
//     //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //       email: emailAddress,
//     //       password: password,
//     //     );
//     //   } on FirebaseAuthException catch (e) {
//     //     if (e.code == 'weak-password') {
//     //       print('The password provided is too weak.');
//     //     } else if (e.code == 'email-already-in-use') {
//     //       print('The account already exists for that email.');
//     //     }
//     //   } catch (e) {
//     //     print(e);
//     //   }
//     }
//   }
// }

