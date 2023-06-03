// import 'package:flutter/material.dart';
//
// import '../USER/UserLOginPage.dart';
// import '../backgrounds.dart';
// import '../login/LoGinPage.dart';
//
// class Choose extends StatelessWidget {
//  // const Choose({Key? key}) : super(key: key);
//   static String routename='chosse';
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Background('assets/images/login2.jpeg'),
//
//         // Image.asset('assets/images/login2.jpeg',
//         //     width: double.infinity,
//         //     height: double.infinity,
//         //     fit: BoxFit.cover),
//
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Column(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> LoGinPage()));
//
//
//                       }, child: Text('Admin',style: TextStyle(color: Colors.black)),style: ElevatedButton.styleFrom(primary:Colors.white,fixedSize: Size(130,130),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
//                       )),
//
//
//                       ElevatedButton(onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> UserLoginPage()));
//                       }, child: Text('User',style: TextStyle(color: Colors.black)),style: ElevatedButton.styleFrom(primary:Colors.white,fixedSize: Size(130,130),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//
//
//
//
//       ],
//
//
//     );
//   }
// }
