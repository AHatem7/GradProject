// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:untitled2/base.dart';
// import 'package:untitled2/database/Attuser(tofirebase).dart';
// import 'package:untitled2/database/database_utils.dart';
//
// class RegisterViewModel extends BaseViewModel<BaseNavigator>{
//
//   // late Connector connector;
//
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   // var showloading =false;
//   // String?message=null;
//   void register(String email, String password,
//       String firstName,
//       String lastName,
//       String phone,
//       String department
//       ) async {
//
//     try {
//       navigator?.showLoading();
//       var result =  await firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       var user = MyUser(
//           id: result.user?.uid??"", fName: firstName, lName: lastName, phone: phone, email: email,department: department);
//       var task = await DataBaseUtils.createDBUser(user);
//
//
//       print('firebase user id = ${result.user?.uid}');
//       navigator?.hideDialog();
//      navigator?.showMessage('Account Added Successfully');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//        navigator?.hideDialog();
//        navigator?.showMessage('The Password is too weak');
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//        navigator?.hideDialog();
//         navigator?.showMessage('The account already exists for that email.');
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//      navigator?.hideDialog();
//       navigator?.showMessage('Something went wrong');
//       print(e);
//     }
//
//   }
// }