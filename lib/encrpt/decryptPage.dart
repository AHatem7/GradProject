// import 'dart:io';
// import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
//
//
//
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'File Encryption Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: UploadFile(),
// //     );
// //   }
// // }
//
// class UploadFile extends StatefulWidget {
//   static String routename = 'm';
//   const UploadFile({Key? key}) : super(key: key);
//
//   @override
//   _UploadFileState createState() => _UploadFileState();
// }
//
// class _UploadFileState extends State<UploadFile> {
//   String? _downloadUrl;
//   String? _fileName;
//   encrypt.Key? _key;
//   encrypt.IV? _iv;
//
//   Future<void> _uploadFile(String filePath, String fileName) async {
//     try {
//       final result = await _uploadEncryptedFileToFirebaseStorageAndFirestore(filePath, fileName);
//       setState(() {
//         _downloadUrl = result['url'];
//         _fileName = fileName;
//         _key = result['key'];
//         _iv = result['iv'];
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('File uploaded successfully'),
//         ),
//       );
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   Future<Map<String, dynamic>> _uploadEncryptedFileToFirebaseStorageAndFirestore(
//       String filePath,
//       String fileName,
//       ) async {
//     // Read the contents of the file
//     final bytes = await File(filePath).readAsBytes();
//
//     // Generate a secret key and initialization vector (IV)
//     final key = encrypt.Key.fromLength(32);
//     final iv = encrypt.IV.fromLength(16);
//
//     // Encrypt the contents of the file using the secret key and IV
//     final encrypter = encrypt.Encrypter(encrypt.AES(key));
//     final encrypted = encrypter.encryptBytes(bytes, iv: iv);
//
//     // Upload the encrypted file to Firebase Storage
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//     final uploadTask = storageRef.putData(encrypted.bytes);
//     final snapshot = await uploadTask.whenComplete(() => null);
//
//     // Get the download URL of the uploaded file
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//
//     // Store the download URL and key/IV in a document in Firestore
//     final docRef = await firestore.FirebaseFirestore.instance
//         .collection('test')
//         .add({'url': downloadUrl, 'key': key.base64, 'iv': iv.base64, 'fileName': fileName, 'createdAt': DateTime.now()});
//
//     // Delete the encrypted file
//     await File(filePath).delete();
//
//     // Return the key, IV, and download URL
//     return {'key': key, 'iv': iv, 'url': downloadUrl};
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed:(){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> FileListPage()));
//
//           }, icon: Icon( Icons.list_alt)),
//         ],
//         title: const Text('Upload File'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () async {
//                 // Show the file picker dialog
//                 final result = await FilePicker.platform.pickFiles(
//                   allowMultiple: false,
//                   type: FileType.custom,
//                   allowedExtensions: ['png', 'jpg', 'pdf'],
//                 );
//
//                 // If no file is selected, show a snackbar and return
//                 if (result == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('No file selected'),
//                     ),
//                   );
//                   return null;
//                 }
//
//                 // Extract the file path and name from the result object
//                 final path = result.files.single.path!;
//                 final fileName = result.files.single.name!;
//
//                 // Call the _uploadFile function with the file path and name
//                 await _uploadFile(path, fileName);
//               },
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.cloud_upload_outlined, size: 100, color: Colors.black),
//                     const Text(
//                       'Upload',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 width: 341,
//                 height: 341,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             if (_downloadUrl != null)
//               Column(
//                 children: [
//                   const SizedBox(height: 30),
//                   Text(
//                     'File uploaded successfully',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FileListPage(),
//                         ),
//                       );
//                     },
//                     child: const Text('View File List'),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FileListPage extends StatefulWidget {
//   const FileListPage({Key? key}) : super(key: key);
//
//   @override
//   _FileListPageState createState() => _FileListPageState();
// }
//
// class _FileListPageState extends State<FileListPage> {
//   List<Map<String, dynamic>> _fileList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getFileList();
//   }
//
//   Future<void> _getFileList() async {
//     final snapshot = await firestore.FirebaseFirestore.instance.collection('test').get();
//     final files = snapshot.docs.map((doc) => doc.data()).toList();
//     setState(() {
//       _fileList = files;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File List'),
//       ),
//       body: ListView.builder(
//         itemCount: _fileList.length,
//         itemBuilder: (context, index) {
//           final file = _fileList[index];
//           return ListTile(
//             title: Text(file['fileName']),
//             subtitle: Text(file['createdAt'].toString()),
//             trailing: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DecryptPage(file['url'], file['key'], file['iv'], file['fileName']),
//                   ),
//                 );
//               },
//               child: const Text('Decrypt'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DecryptPage extends StatefulWidget {
//   final String url;
//   final String _key;
//   final String iv;
//   final String fileName;
//
//   const DecryptPage(this.url, this._key, this.iv, this.fileName, {Key? key}) : super(key: key);
//
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   bool _isDecrypting = false;
//
//   Future<void> _decryptFile() async {
//     try {
//       setState(() {
//         _isDecrypting = true;
//       });
//
//       // Download the encrypted file from Firebase Storage
//       final http.Response response = await http.get(Uri.parse(widget.url));
//       final encryptedBytes = response.bodyBytes;
//
//       // Decrypt the contents of the file using the key and IV
//       final encrypter = encrypt.Encrypter(encrypt.AES(encrypt.Key.fromBase64(widget._key)));
//       final decrypted = encrypter.decryptBytes(encrypt.Encrypted(encryptedBytes), iv: encrypt.IV.fromBase64(widget.iv));
//
//       // Write the decrypted contents to a new file
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/${widget.fileName}';
//       await File(filePath).writeAsBytes(decrypted);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('File decrypted successfully'),
//         ),
//       );
//
//       // Open the decrypted file
//       await OpenFile.open(filePath);
//     } on Exception catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error decrypting file: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() {
//         _isDecrypting = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Decrypt File'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_isDecrypting)
//               const CircularProgressIndicator()
//             else
//               ElevatedButton(
//                 onPressed: _decryptFile,
//                 child: const Text('Decrypt File'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:typed_data';

import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/////////////////////////////////////////////////////////////////////////////
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
//
//
//
// class DecryptionPage extends StatefulWidget {
//   const DecryptionPage({Key? key}) : super(key: key);
//   static const String routeName ='d2';
//
//
//   @override
//   State<DecryptionPage> createState() => _DecryptionPageState();
// }
//
// class _DecryptionPageState extends State<DecryptionPage> {
//   String? _path;
//   String? decFilepath;
//   String? filename;
//
//   // Future<File> saveFilePermanently(String filename, String data) async {
//   //   final appStorage = await getExternalStorageDirectory();
//   //   final newFile = File('${appStorage!.path}/$filename');
//   //   return newFile.writeAsString(data);
//   // }
//
//   bool _validate = false;
//   final _textController = TextEditingController();
//
//   Widget _buildDecryptButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           height: 1.4 * (MediaQuery.of(context).size.height / 20),
//           width: 5 * (MediaQuery.of(context).size.width / 10),
//           margin: const EdgeInsets.only(bottom: 20),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               primary: const Color(0xffDCCDA8),
//               shape: const StadiumBorder(),
//             ),
//             onPressed: () async
//             {
//               FocusScope.of(context).unfocus();
//               setState(() {
//                 _textController.text.isEmpty
//                     ? _validate = true
//                     : _validate = false;
//               });
//
//               if (filename != null && _textController.text != null) {
//                 // Downloads the encrypted file from Firebase Storage.
//                 final ref = FirebaseStorage.instance.ref().child(filename!);
//                 final encryptedFileBytes = await ref.getData();
//                 final encryptedFile = Uint8List.fromList(encryptedFileBytes!);
//
//                 // Creates an instance of AesCrypt class.
//                 AesCrypt crypt = AesCrypt();
//
//                 // Sets decryption password.
//                 crypt.aesSetMode(AesMode.cbc);
//                 crypt.setPassword(_textController.text);
//
//                 // Sets overwrite mode.
//                 // It's optional. By default the mode is 'AesCryptOwMode.warn'.
//                 crypt.setOverwriteMode(AesCryptOwMode.rename);
//
//                 try {
//                   // Decrypts the file and saves it to a file with '_decrypted' suffix added.
//                   // In this case it will be '$filename_decrypted'.
//                   // It returns a path to the decrypted file.
//                   final decryptedData = await crypt.decryptData(encryptedFile);
//                   decFilepath = utf8.decode(decryptedData);
//                   print('The decryption has been completed successfully.');
//                   print('Decrypted file: $decFilepath');
//
//                   // final decryptedFile = await saveFilePermanently(
//                   //     '$filename.decrypted.txt', decFilepath!);
//
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       backgroundColor: Color(0xff006aff),
//                       content: Text(
//                         'File decrypted successfully!',
//                         textAlign: TextAlign.center,
//                       )));
//
//                   // Optionally, you can also delete the encrypted file from Firebase Storage
//                   // after decryption.
//                   // await ref.delete();
//                 } on AesCryptException catch (e) {
//                   print('The decryption has been failed.');
//                   print(e);
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       backgroundColor: Color(0xffee122a),
//                       content: Text(
//                         'Failed to decrypt the file! Please check the filename and password.',
//                         textAlign: TextAlign.center,
//                       )));
//                 }
//               }
//
//               if (filename == null) {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     backgroundColor: Color(0xffee122a),
//                     content: Text(
//                       'Please enter filename',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     )));
//               }
//
//               setState(() {
//                 _textController.clear();
//               });
//             },
//             child: Text(
//               "Decrypt",
//               style: TextStyle(color: Colors.white,fontSize: 17),
//
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildFilenameRow() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       child: TextField(
//         onChanged: (value) {
//           setState(() {
//             filename = value;
//           });
//         },
//         decoration: InputDecoration(
//           focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xffDCCDA8), width: 2.0),
//           ),
//           enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xffDCCDA8), width: 1.5)),
//           hintText: "Enter filename",
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPasswordRow(){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       child: TextField(
//         controller: _textController,
//         obscureText: true,
//         decoration: InputDecoration(
//           focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Color(0xffDCCDA8), width: 2.0),
//           ),
//           enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xffDCCDA8), width: 1.5)),
//           hintText: "Enter password",
//           errorText: _validate ? 'Password can\'t be empty' : null,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffDCCDA8),
//         title: const Text('File Decryption'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             _buildFilenameRow(),
//             _buildPasswordRow(),
//             _buildDecryptButton(),
//           ],
//         ),
//       ),
//     );
//   }
//}


//////////////////////////////////////////////////////////////////////////////////////////


//
// class DecryptionPage extends StatefulWidget {
//   const DecryptionPage({Key? key}) : super(key: key);
//   static const String routeName ='d2';
//
//
//   @override
//   State<DecryptionPage> createState() => _DecryptionPageState();
// }
//
// class _DecryptionPageState extends State<DecryptionPage> {
//   String? _path;
//   String? decFilepath;
//   String? filename;
//
//   get appStorage => null;
//
//   Future<File> saveFile(String file) async {
//     Directory? appStorage = await getExternalStorageDirectory();
//     var fileName = (file.split('/').last);
//     final newfile = ('${appStorage!.path}/$fileName');
//
//     return File(file).copy(newfile);
//   }
//
//   final _textController = TextEditingController();
//
//
//   Widget _buildAddFileButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//
//         Opacity(
//           opacity: 0.5,
//           child: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Card(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   color: Color.fromRGBO(220,205, 151, 1),
//                   child:
//                   InkWell(
//                     onTap: () async
//                     {
//                       // Select the encrypted file from Firebase Storage.
//                       final storageRef = FirebaseStorage.instance.ref('test/$filename');
//                       final encryptedFileBytes = await storageRef.getData();
//                       final encryptedFile = await saveFile('${appStorage!.path}/encrypted_file.aes');
//                       await encryptedFile.writeAsBytes(encryptedFileBytes as List<int>);
//
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           backgroundColor: const Color(0xff006aff),
//                           content: Text(
//                             ' Encrypted File Downloaded Successfully',
//                             textAlign: TextAlign.center,
//                           )));
//                       setState(() {
//                         _path = encryptedFile.path;
//                       });
//                     },
//
//
//                     child: Container(
//                       child:
//                       Column( mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(Icons.cloud_download_outlined, size: 100, color: Colors.black),
//                           Text('Download Encrypted File', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
//                         ],
//                       ),
//                       width: 300,
//                       height: 300,
//
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
//                       ),
//
//                     ),
//
//                   ),
//
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//
//       ],
//     );
//   }
//
//   Widget _buildDecryptButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           height: 1.4 * (MediaQuery.of(context).size.height / 20),
//           width: 5 * (MediaQuery.of(context).size.width / 10),
//           margin: const EdgeInsets.only(bottom: 20),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               primary: const Color(0xffDCCDA8),
//               shape: const StadiumBorder(),
//             ),
//             onPressed: () async
//             {
//               FocusScope.of(context).unfocus();
//               if (_path != null && _textController.text.isNotEmpty) {
//                 // Creates an instance of AesCrypt class.
//                 AesCrypt crypt = AesCrypt();
//
//                 // Sets decryption password.
//                 crypt.setPassword(_textController.text);
//
//                 // Sets overwrite mode.
//                 // It's optional. By default the mode is 'AesCryptOwMode.warn'.
//                 crypt.setOverwriteMode(AesCryptOwMode.rename);
//
//                 try {
//                   // Decrypts the file and saves the decrypted file to a file with
//                   // '_decrypted' extension added. In this case it will be '$_path_decrypted'.
//                   // It returns a path to decrypted file.
//                   decFilepath = crypt.decryptFileSync(_path!);
//
//                   print('The decryption has been completed successfully.');
//                   print('Decrypted file: $decFilepath');
//
//                   // Save the decrypted file to local storage.
//                   final decryptedFile = await saveFile(decFilepath!);
//                   final fileName = decryptedFile.path.split('/').last;
//
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       backgroundColor: Color(0xff006aff),
//                       content: Text(
//                         ' File Decryption Success',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       )));
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       backgroundColor: Color(0xff006aff),
//                       content: Text(
//                         ' File Saved',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       )));
//                 } on AesCryptException catch (e) {
//                   print('The decryption has been completedwith errors.');
//                   {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         backgroundColor: Colors.red,
//                         content: Text(
//                           'Password is incorrect',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         )));
//                   }
//                   // else {
//                   //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   //       backgroundColor: Colors.red,
//                   //       content: Text(
//                   //         'An error occurred during decryption',
//                   //         textAlign: TextAlign.center,
//                   //         style: TextStyle(
//                   //             color: Colors.white,
//                   //             fontWeight: FontWeight.bold),
//                   //       )));
//                   // }
//                 }
//               } else if (_path == null) {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     backgroundColor: Colors.red,
//                     content: Text(
//                       'Please download an encrypted file first',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )));
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     backgroundColor: Colors.red,
//                     content: Text(
//                       'Please enter a password',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )));
//               }
//             },
//             child: Text(
//               "Decrypt File",
//               style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height / 50,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Decryption Page')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               _buildAddFileButton(),
//               const SizedBox(height: 20),
//               _path != null
//                   ? Text(
//                 'Encrypted file: ${_path!.split('/').last}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 16),
//               )
//                   : const SizedBox.shrink(),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter decryption password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               _buildDecryptButton(),
//               const SizedBox(height: 20),
//               decFilepath != null
//                   ? Text(
//                 'Decrypted file: ${decFilepath!.split('/').last}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 16),
//               )
//                   : const SizedBox.shrink(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//////////////////////////////////////////////////////////////////////////////////////

//z
//////////////////////////// sha8al al a7mr ******************
//
//
//
//



//
// import 'dart:io';
//
// // import 'package:aes_crypt/aes_crypt.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DecryptPage extends StatefulWidget {
//   static String routename ='ddddddeeee';
//   const DecryptPage({Key? key}) : super(key: key);
//
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _fileNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;
//   String? _decryptedFilePath;
//
//   @override
//   void dispose() {
//     _fileNameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _decryptFile(String fileName, String password) async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     // Get reference to encrypted file in Firebase Storage.
//     final storageRef =
//     firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//
//     try {
//       // Download encrypted file to device.
//       final tempDir = await getTemporaryDirectory();
//       final encryptedFilePath = '${tempDir.path}/$fileName';
//       await storageRef.writeToFile(File(encryptedFilePath));
//
//       // Decrypt file.
//       // final decryptedFilePath =
//       // await AesCrypt.decryptFile(encryptedFilePath, password);
//       // Create instance of AesCrypt class.
//       final crypt = AesCrypt(password);
//
//       // Decrypt file.
//       final decryptedFilePath = await crypt.decryptFile(encryptedFilePath, '${tempDir.path}/$fileName.decrypted');
//
//       setState(() {
//         _decryptedFilePath = decryptedFilePath;
//         _isLoading = false;
//       });
//
//       // Show success message.
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Color(0xff006aff),
//         content: Text(
//           'File Decryption Success',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ));
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//
//       // Show error message.
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Color(0xffee122a),
//         content: Text(
//           'File Decryption Failed',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decrypt File'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _fileNameController,
//                   decoration: InputDecoration(
//                     labelText: 'File Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a file name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _isLoading
//                       ? null
//                       : () {
//                     if (_formKey.currentState!.validate()) {
//                       final fileName = _fileNameController.text;
//                       final password = _passwordController.text;
//                       _decryptFile(fileName, password);
//                     }
//                   },
//                   child: _isLoading
//                       ? SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   )
//                       : Text('Decrypt'),
//                 ),
//                 if (_decryptedFilePath != null)
//                   SizedBox(height: 20),
//                 Text(
//                   'Decrypted File Path: $_decryptedFilePath',
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////sah8al decrypt from firebase ***************************************

//
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// //import 'package:aes_crypt/aes_crypt.dart';
//
// class DecryptPage extends StatefulWidget {
//   static String routename ='ddddddeeee';
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _fileNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   Future<Uint8List>? _decryptedFileData;
//
//   Future<Uint8List> _decryptFile(String fileName, String password) async {
//     // Get reference to encrypted file in Firebase Storage.
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//
//     // Download encrypted file to device.
//     // final tempDir = await getTemporaryDirectory();
//
//     final encryptedFilePath = '${storageRef}/$fileName';
//     await storageRef.writeToFile(File(encryptedFilePath));
//
//     // Create instance of AesCrypt class.
//     final crypt = AesCrypt(password);
//
//     // Decrypt file.
//     final decryptedFilePath = await crypt.decryptFile(encryptedFilePath, '${storageRef}/$fileName.decrypted');
//
//     // Load decrypted file into memory.
//     final decryptedFile = File(decryptedFilePath);
//     final decryptedFileData = await decryptedFile.readAsBytes();
//
//     return decryptedFileData;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decrypt File'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _fileNameController,
//                   decoration: InputDecoration(
//                     labelText: 'File Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a file name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       final fileName = _fileNameController.text;
//                       final password = _passwordController.text;
//                       setState(() {
//                         _decryptedFileData = _decryptFile(fileName, password);
//                       });
//                     }
//                   },
//                   child: Text('Decrypt'),
//                 ),
//                 if (_decryptedFileData == null)
//                   SizedBox(height: 20)
//                 else
//                   FutureBuilder<Uint8List>(
//                     future: _decryptedFileData!,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else if (snapshot.hasData) {
//                         return Image.memory(snapshot.data!);
//                       } else {
//                         return SizedBox();
//                       }
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//////////////////////////////////////////////////////////////////////sha8al bigib path

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// //import 'package:aes_crypt/aes_crypt.dart';
// import 'dart:io';
//
// class DecryptPage extends StatefulWidget {
//   static String routename ='ddddddeeee';
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _fileNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   Uint8List? _decryptedFileData;
//   bool _isLoading = false;
//
//   Future<Uint8List> _decryptFile(String fileName, String password) async {
//     // Get reference to encrypted file in Firebase Storage.
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//
//     // Download encrypted file to device.
//     final tempDir = await getTemporaryDirectory();
//     final encryptedFilePath = '${tempDir.path}/$fileName';
//     await storageRef.writeToFile(File(encryptedFilePath));
//
//     // Create instance of AesCrypt class.
//     final crypt = AesCrypt(password);
//
//     // Decrypt file.
//     final decryptedFilePath = await crypt.decryptFile(encryptedFilePath, '${tempDir.path}/$fileName.decrypted');
//
//     // Load decrypted file into memory.
//     final decryptedFile = File(decryptedFilePath);
//     final decryptedFileData = await decryptedFile.readAsBytes();
//
//     return decryptedFileData;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decrypt File'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _fileNameController,
//                   decoration: InputDecoration(
//                     labelText: 'File Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a file name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _isLoading
//                       ? null
//                       : () async {
//                     if (_formKey.currentState!.validate()) {
//                       final fileName = _fileNameController.text;
//                       final password = _passwordController.text;
//                       setState(() {
//                         _isLoading = true;
//                       });
//                       _decryptedFileData = await _decryptFile(fileName, password);
//                       setState(() {
//                         _isLoading = false;
//                       });
//                     }
//                   },
//                   child: _isLoading
//                       ? SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   )
//                       : Text('Decrypt'),
//                 ),
//                 if (_decryptedFileData != null)
//                   Image.memory(
//                     _decryptedFileData!,
//                     fit: BoxFit.cover,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//////////////////////////////////////////////////////////////////////////



//
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// //import 'package:aes_crypt/aes_crypt.dart';
// import 'dart:io';
//
// class DecryptPage extends StatefulWidget {
//   static String routename ='ddddddeeee';
//   @override
//   _DecryptPageState createState() => _DecryptPageState();
// }
//
// class _DecryptPageState extends State<DecryptPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _fileNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   Uint8List? _decryptedFileData;
//   bool _isLoading = false;
//
//   // Future<Uint8List> _decryptFile(String fileName, String password) async {
//   //   // Get reference to encrypted file in Firebase Storage.
//   //   final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//   //
//   //   // Download encrypted file to device.
//   //   final tempDir = await getTemporaryDirectory();
//   //   final encryptedFilePath = '${tempDir.path}/$fileName';
//   //   await storageRef.writeToFile(File(encryptedFilePath));
//   //
//   //   // Create instance of AesCrypt class.
//   //   final crypt = AesCrypt(password);
//   //
//   //   // Decrypt file.
//   //   final decryptedFilePath = await crypt.decryptFile(encryptedFilePath, '${tempDir.path}/$fileName.decrypted');
//   //
//   //   // Load decrypted file into memory.
//   //   final decryptedFile = File(decryptedFilePath);
//   //   final decryptedFileData = await decryptedFile.readAsBytes();
//   //
//   //   return decryptedFileData;
//   // }
//   Future<Uint8List> _decryptFile(String fileName, String password) async {
//     // Get reference to encrypted file in Firebase Storage.
//     final storageRef = firebase_storage.FirebaseStorage.instance.ref('test/$fileName');
//
//     // Download encrypted file to device.
//     final tempDir = await getTemporaryDirectory();
//     final encryptedFilePath = '${tempDir.path}/$fileName';
//     await storageRef.writeToFile(File(encryptedFilePath));
//
//     // Create instance of AesCrypt class.
//     final crypt = AesCrypt(password);
//
//     // Delete any existing decrypted file.
//     final decryptedFilePath = '${tempDir.path}/$fileName.aes.decrypted';
//     final decryptedFile = File(decryptedFilePath);
//     if (await decryptedFile.exists()) {
//       await decryptedFile.delete();
//     }
//
//     // Decrypt file.
//     await crypt.decryptFile(encryptedFilePath, decryptedFilePath);
//
//     // Load decrypted file into memory.
//     final decryptedFileData = await decryptedFile.readAsBytes();
//
//     return decryptedFileData;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decrypt File'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _fileNameController,
//                   decoration: InputDecoration(
//                     labelText: 'File Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a file name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _isLoading
//                       ? null
//                       : () async {
//                     if (_formKey.currentState!.validate()) {
//                       final fileName = _fileNameController.text;
//                       final password = _passwordController.text;
//                       setState(() {
//                         _isLoading = true;
//                       });
//                       _decryptedFileData = await _decryptFile(fileName, password);
//                       setState(() {
//                         _isLoading = false;
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DecryptedFilePage(
//                             fileData: _decryptedFileData!,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   child: _isLoading
//                       ? SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   )
//                       : Text('Decrypt'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DecryptedFilePage extends StatelessWidget {
//   final Uint8List fileData;
//
//   const DecryptedFilePage({required this.fileData});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decrypted File'),
//       ),
//       body: Image.memory(
//         fileData,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
//
/////////////////////////////////////////////////////////////////////////////////////////////







