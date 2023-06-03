// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseStorageListView extends StatefulWidget {
//   static String routename = 'te';
//   @override
//   _FirebaseStorageListViewState createState() => _FirebaseStorageListViewState();
// }
//
// class _FirebaseStorageListViewState extends State<FirebaseStorageListView> {
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   late ListResult _result;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     _result = await _storage.ref().listAll();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage List Example'),
//       ),
//       body: _result == null
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : _result.items.isEmpty
//           ? Center(
//         child: Text('No files found.'),
//       )
//           : ListView.builder(
//         itemCount: _result.items.length,
//         itemBuilder: (BuildContext context, int index) {
//           final item = _result.items[index];
//           return ListTile(
//             title: Text(item.name),
//             trailing: Icon(Icons.arrow_forward_ios),
//             onTap: () async {
//               final url = await item.getDownloadURL();
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => Scaffold(
//                     appBar: AppBar(
//                       title: Text(item.name),
//                     ),
//                     body: Center(
//                       child: Image.network(url),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseStorageListView extends StatefulWidget {
//   static const routename = 'firebase-storage-list-view';
//
//   @override
//   _FirebaseStorageListViewState createState() => _FirebaseStorageListViewState();
// }
//
// class _FirebaseStorageListViewState extends State<FirebaseStorageListView> {
//   late ListResult _result;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadFiles();
//   }
//
//   Future<void> _loadFiles() async {
//     _result = await _storage.ref().listAll();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage List Example'),
//       ),
//       body: _result == null
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : _result.items.isEmpty
//           ? Center(
//         child: Text('No files found.'),
//       )
//           : ListView.builder(
//         itemCount: _result.items.length,
//         itemBuilder: (BuildContext context, int index) {
//           final item = _result.items[index];
//           return ListTile(
//             title: Text(item.name),
//             trailing: Icon(Icons.arrow_forward_ios),
//             onTap: () async {
//               final url = await item.getDownloadURL();
//               Navigator.of(context).pushNamed(
//                 '/file-details',
//                 arguments: {'name': item.name, 'url': url},
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }