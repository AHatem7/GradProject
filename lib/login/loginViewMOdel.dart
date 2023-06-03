// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled2/base.dart';
// import 'package:untitled2/firebase_errors.dart';
// import 'package:untitled2/login/Navigator_viewModel.dart';
//
// import '../database/Attuser(tofirebase).dart';
// import '../database/database_utils.dart';
// import '../home/BottomNavigationBarItem.dart';
//
// class LoginViewModel extends BaseViewModel<LoginNavigator>{
// void login(String email,String password)async{
//
// var firebaseAuth=FirebaseAuth.instance;
//   // try {
//   //   navigator?.showLoading();
//   //   print('dialoge shown');
//   //   var result =  await firebaseAuth.signInWithEmailAndPassword(
//   //       email: email, password: password);
//   //   print('firebase user id = ${result.user?.uid}');
//   //   navigator?.hideDialog();
//   //   navigator?.showMessage('User Logged Successfully');
//   //   navigator?.hideDialog();
//   //  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const DirectoryPage()));
//   //
//   //
//   // } on FirebaseAuthException catch (e) {
//   //   navigator?.showMessage('Wrong email or password ');
//   // } catch (e) {
//   //   navigator?.hideDialog();
//   //   navigator?.showMessage('Something went wrong');
//   //   print(e);
//   // }
//
//   //////////////////////////////////
//
//
// String? message;
// try {
//   navigator?.showLoading();
//   var result = await firebaseAuth.signInWithEmailAndPassword(
//       email: email, password: password, );
//   // read user in databse
//
//   var userObj = DataBaseUtils.readUser(result.user?.uid??"");
//   if(userObj==null){
//     message = 'Failed to complete sign in';
//   }else{
//     //goto home
//     navigator?.gotoHome();
//   }
//   var user = MyUser(
//       id: result.user?.uid ?? "",
//       email: email,lName: '', fName: '', phone: '', department: '',
//   );
//   var task =  await DataBaseUtils.createDBUser(user);
//   navigator?.gotoHome();
//
//   return;
// } on FirebaseAuthException catch (e) {
//   if (e.code == FirebaseErrors) {
//     message = 'The password provided is too weak.';
//   }
//   else {
//     message = 'Wrong username or password';
//   }
// } catch (e) {
//   message = 'something went wrong';
// }
// navigator?.hideDialog();
// if (message != null) {
//   navigator?.showMessage(message);
// }
//
// }
// }
