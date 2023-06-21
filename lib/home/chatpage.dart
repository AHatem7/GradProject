// // import 'package:flutter/material.dart';
// // import 'package:untitled2/requestcard.dart';
// //
// // class RequestPage extends StatelessWidget {
// //   const RequestPage({Key? key}) : super(key: key);
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Expanded(
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //
// //               Column(mainAxisAlignment: MainAxisAlignment.end,
// //                 children: const [],
// //               ),
// //             ],
// //           ),
// //         ),
// //         SizedBox(height: 620,
// //           child: ListView(children: [
// //             RequestCard(name: 'Lojain Amr',id: '89504', message: "Want to access 'this file'"),
// //             RequestCard(name: 'Salma Abdelrazek',id: '89575', message: "Want to access 'this file'"),
// //             RequestCard(name: 'Sohaila Mohamed',id: '89459', message: "Want to access 'this file'"),
// //             RequestCard(name: 'Hesham Saleh',id: '89581', message: "Want to access 'this file'"),
// //             RequestCard(name: 'Nouran Ashraf',id: '89550', message: "Want to access 'this file'"),
// //
// //
// //           ]),)
// //
// //       ],);
// //   }
// // }
//
// /////////////////////////////////////////////////////////////////////////////////////
//
// ///////////////////////////////////////////////////////////////////
//
//
//
// //
// // import 'package:flutter/material.dart';
// //
// // import '../backgrounds.dart';
// //
// // class Chat extends StatelessWidget {
// //   //const Chat({Key? key}) : super(key: key);
// //   static String routename = 'chat';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Stack(
// //       children: [
// //
// //
// //         Background('assets/images/BG1.png'),
// //
// //
// //
// //
// //
// //       ],
// //
// //     );
// //   }
// // }
// //////////////////////////////////////////////////////////////////
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../backgrounds.dart';
// import 'message.dart';
//
// class chatpage extends StatefulWidget {
//   static String routename = 'chatpage';
//   String email;
//   chatpage({required this.email});
//   @override
//   _chatpageState createState() => _chatpageState(email: email);
// }
//
// class _chatpageState extends State<chatpage> {
//   String email;
//   _chatpageState({required this.email});
//
//   final fs = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   final TextEditingController message = new TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Background('assets/images/BG1.png'),
//
//
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0),
//
//
//
//         // appBar: AppBar(
//         //   title: Text(
//         //     'data',
//         //   ),
//         //   // actions: [
//         //   //   MaterialButton(
//         //   //     onPressed: () {
//         //   //       _auth.signOut().whenComplete(() {
//         //   //         Navigator.pushReplacement(
//         //   //           context,
//         //   //           MaterialPageRoute(
//         //   //             builder: (context) => Home(),
//         //   //           ),
//         //   //         );
//         //   //       });
//         //   //     },
//         //   //     child: Text(
//         //   //       "signOut",
//         //   //     ),
//         //   //   ),
//         //   // ],
//         // ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.79,
//                 child: messages(
//                   email: email,
//                 ),
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: message,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor:
//                         //Colors.white,
//                         Color.fromRGBO(220,205, 168,1),
//                         hintText: 'message',
//                         // hintStyle: TextStyle(color: Colors.black,fontSize: 15),
//                         enabled: true,
//                         contentPadding: const EdgeInsets.only(
//                             left: 14.0, bottom: 8.0, top: 8.0),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
//                           borderRadius: new BorderRadius.circular(15),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.black87,style: BorderStyle.none),
//                           borderRadius: new BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {},
//                       onSaved: (value) {
//                         message.text = value!;
//                       },
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       if (message.text.isNotEmpty) {
//                         fs.collection('Messages').doc().set({
//                           'message': message.text.trim(),
//                           'time': DateTime.now(),
//                           'email': email,
//                         });
//
//                         message.clear();
//                       }
//                     },
//                     icon: Icon(Icons.send_sharp),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       ], );
//   }
// }



//import 'package:path/path.dart';
//import 'package:permission_handler/permission_handler.dart';
// /*class DecryptionScreen extends StatefulWidget {
//   const DecryptionScreen({Key? key}) : super(key: key);
//
//   @override
//   _IdentityPageState createState() => _IdentityPageState();
// }
//
// class _IdentityPageState extends State<DecryptionScreen> {
//   int count = 0;
//   String? _path;
//   String? _pathpic;
//   String? pat;
//   String? decFilepath;
//   String? filename;
//   String? _tempfilename;
//
//   Future<File> saveFilePermanently(PlatformFile file) async {
//     final appStorage = await getExternalStorageDirectory();
//     final newFile = File('${appStorage!.path}/${file.name}');
//     return File(file.path!).copy(newFile.path);
//   }
//
//   Future<File> saveFile(String file) async {
//     Directory? appStorage = await getExternalStorageDirectory();
//     var fileName = (file.split('/').last);
//     final newfile = ('${appStorage!.path}/$fileName');
//
//     return File(file).copySync(newfile);
//   }
//
//   /* Future<File> saveFile1(String file) async {
//     const appStorage = ('/storage/emulated/0/Download');
//     var fileName = (file.split('/').last);
//     final newfile = ('$appStorage/$fileName');
//
//     return (File(file).copy(newfile));
//   }
// */
//   final _textController = TextEditingController();
//   final _textController1 = TextEditingController();
//   bool _validate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color(0xFF1D1D35),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 45, vertical: 10),
//                     child: TextField(
//                       controller: _textController,
//                       decoration: InputDecoration(
//                           errorText: _validate ? 'please enter password' : null,
//                           hintText: 'Enter your pin or password',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: const OutlineInputBorder(
//                               borderSide: BorderSide(width: 4),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               )),
//                           suffixIcon: IconButton(
//                               onPressed: () {
//                                 _textController.clear();
//                               },
//                               icon: const Icon(Icons.clear))),
//                       obscureText: true,
//                       maxLength: 20,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 45),
//                     child: TextField(
//                       controller: _textController1,
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: 'filename with extension',
//                           border: const OutlineInputBorder(
//                               borderSide: BorderSide(width: 4),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               )),
//                           suffixIcon: IconButton(
//                               onPressed: () {
//                                 _textController1.clear();
//                               },
//                               icon: const Icon(Icons.clear))),
//                       obscureText: false,
//                       maxLength: 50,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       FilePickerResult? result =
//                           await FilePicker.platform.pickFiles();
//
//                       if (result != null) {
//                         PlatformFile file = result.files.first;
//                         pat = file.name;
//                         _pathpic = file.path;
//                         print(_pathpic);
//                         count = 1;
//                       } else {
//                         print("abort");
//                       }
//                       // encFilepath = _path;
//                       //downlaodFile();
//                     },
//                     child:
//                         const Text('Add File', style: TextStyle(fontSize: 22)),
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                     ),
//                   ),
//                   ElevatedButton(
//                     child:
//                         const Text('Decrypt', style: TextStyle(fontSize: 22)),
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                     ),
//                     onPressed: () async {
//                       setState(() {
//                         _textController.text.isEmpty
//                             ? _validate = true
//                             : _validate = false;
//                       });
//                       if (_textController.text != null &&
//                           (_textController1.text != null || _pathpic != null)) {
//                         _tempfilename = _textController1.text;
//                         if (count == 0) {
//                           var dir = getExternalStorageDirectory();
//                           _path = ('$dir/$_tempfilename.aes');
//                         } else if (count == 1) {
//                           _path = _pathpic;
//                         }
//
//                         // Creates an instance of AesCrypt class.
//                         AesCrypt crypt = AesCrypt();
//                         crypt.aesSetMode(AesMode.cbc);
//                         crypt.setOverwriteMode(AesCryptOwMode.rename);
//                         crypt.setPassword(_textController.text);
//
//                         try {
//                           decFilepath = crypt.decryptFileSync(_path!);
//                           print(
//                               'The decryption has been completed successfully.');
//                           print('Decrypted file 1: $decFilepath');
//                           if (count == 1) {
//                             // final newfile1 = await saveFile1(decFilepath!);
//                             final newFile = await saveFile(decFilepath!);
//
//                             print(newFile);
//                             // print(newfile1);
//                           } else {
//                             print('File content: ' + File(decFilepath!).path);
//                             final newfile = await saveFile(decFilepath!);
//                             print(newfile);
//                           }
//                         } on AesCryptException catch (e) {
//                           if (e.type == AesCryptExceptionType.destFileExists) {
//                             print(
//                                 'The decryption has been completed unsuccessfully.');
//                             print(e.message);
//                           }
//                         }
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }*/


import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class decryptionPage extends StatefulWidget {
  const decryptionPage({Key? key}) : super(key: key);
  static const String routeName ='d1';

  @override
  State<decryptionPage> createState() => _decryptionPageState();
}

class _decryptionPageState extends State<decryptionPage> {
  int count = 0;
  String? _path;
  String? _pathpic;
  String? pat;
  String? decFilepath;
  String? filename;
  String? _tempfilename;


  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getExternalStorageDirectory();
    final newFile = File('${appStorage!.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  Future<File> saveFile(String file) async {
    Directory? appStorage = await getExternalStorageDirectory();
    var fileName = (file.split('/').last);
    final newfile = ('${appStorage!.path}/$fileName');

    return File(file).copySync(newfile);
  }

  Future<File> _downloadFile(String url, String fileName) async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir!.path}/$fileName';
    File file = File(filePath);
    try {
      await firebase_storage.FirebaseStorage.instance.refFromURL(url).writeToFile(file);
      return file;
    } catch (e) {
      print(e.toString());
      if (file.existsSync()) {
        await file.delete();
      }
      throw Exception('Failed to download file: $fileName');
    }
  }

  Future<String> _decryptFile(String filePath, String password) async {
    String decryptedFilePath = '${filePath.substring(0, filePath.lastIndexOf('.aes'))}.txt';
    AesCrypt crypt = AesCrypt();
    crypt.aesSetMode(AesMode.cbc);
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword(password);
    try {
      await crypt.decryptFile(filePath, decryptedFilePath);
      print('The file has been decrypted successfully.');
      return decryptedFilePath;
    } catch (e) {
      print(e.toString());
      if (File(decryptedFilePath).existsSync()) {
        await File(decryptedFilePath).delete();
      }
      throw Exception('Failed to decrypt file: $filePath');
    }
  }

  final _textController = TextEditingController();
  final _textController1 = TextEditingController();
  bool _validate = false;

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Decryption',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 25,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
              )),
        ],
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        textAlign: TextAlign.center,
        controller: _textController,
        decoration: InputDecoration(
          errorText: _validate ? 'please enter password' : null,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffee122a), width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffee122a), width: 1.5)),
          hintText: "Enter password",
        ),
        obscureText: true,
      ),
    );
  }

  Widget _wfilepath() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextField(
        textAlign: TextAlign.center,
        controller: _textController1,
        decoration: InputDecoration(
          errorText: _validate ? 'Please enter file name' : null,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffee122a), width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffee122a), width: 1.5)),
          hintText: "Enter File name",
        ),
      ),
    );
  }

  Widget _buildAddFileButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20, top: 5),
          child: ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                PlatformFile file = result.files.first;
                pat = file.name;
                _pathpic = file.path;
                print(_pathpic);
                count = 1;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xff006aff),
                    content: Text(' File Selected')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xffee122a),
                    content: Text(' File not Selected.Abort')));
                print("abort");
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffee122a),
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Add File",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildChooseFileButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20, top: 5),
          child: ElevatedButton(
            onPressed: () async {
              Reference ref = FirebaseStorage.instance.ref().child('test');
              ListResult result = await ref.listAll();
              List<String> fileNames = result.items.map((item) => item.name).toList();
              // Display a dialog with the list of file names and allow the user to choose one
              String? chosenFileName = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('Choose a file to decrypt'),
                    children: fileNames.map((fileName) {
                      return SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, fileName);
                        },
                        child: Text(fileName),
                      );
                    }).toList(),
                  );

                },
              );
              // if (chosenFileName != null) {
              //   String url = await ref.child(chosenFileName).getDownloadURL();
              //   File file = await _downloadFile(url, chosenFileName);
              //   String password = 'my_password';
              //   String decryptedFilePath = await _decryptFile(file.path, password);
              // }
              if (chosenFileName != null) {
                String url = await ref.child(chosenFileName).getDownloadURL();
                File file = await _downloadFile(url, chosenFileName);
                _pathpic = file.path;
                print(_pathpic);
                count = 1;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xff006aff),
                    content: Text(' File Selected')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xffee122a),
                    content: Text(' File not Selected.Abort')));
                print("abort");
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffee122a),
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Choose",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _builddecryptButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffee122a),
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              FocusScope.of(context).unfocus();
              setState(() {
                _textController.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
              if (_textController.text != null &&
                  (_textController1.text != null || _pathpic != null)) {
                _tempfilename = _textController1.text;
                if (count == 0) {
                  var dir = getExternalStorageDirectory();
                  _path = ('$dir/$_tempfilename.aes');
                } else if (count == 1) {
                  _path = _pathpic;
                }

                // Creates an instance of AesCrypt class.
                AesCrypt crypt = AesCrypt();
                crypt.aesSetMode(AesMode.cbc);
                crypt.setOverwriteMode(AesCryptOwMode.rename);
                crypt.setPassword(_textController.text);

                try {
                  decFilepath = crypt.decryptFileSync(_path!);
                  print('The decryption has been completed successfully.');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff006aff),
                      content: Text(
                        ' File Decryption Success',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )));
                  print('Decrypted file 1: $decFilepath');
                  if (count == 1) {

                    final decryptedFile = await saveFile(decFilepath!);
                    final fileName = decryptedFile.path.split('/').last;
                    final fileBytes = await decryptedFile.readAsBytes();
                    final storageRef = FirebaseStorage.instance.ref('test/$fileName');
                    final uploadTask = storageRef.putData(fileBytes);

                    await uploadTask.whenComplete(()  =>{print('File upload success. ')}
                    );

                        // final newfile1 = await saveFile1(decFilepath!);
                   // final newFile = await saveFile(decFilepath!);

                    //print(newFile);
                    // print(newfile1);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color(0xff006aff),
                        content: Text(
                          ' File Saved',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )));
                  } else {
                    print('File content: ' + File(decFilepath!).path);
                    final newfile = await saveFile(decFilepath!);
                    print(newfile);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color(0xff006aff),
                        content: Text(
                          ' File Saved',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )));
                  }
                } catch (e) {
                  print('The decryption has been completed unsuccessfully.');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xffee122a),
                      content: Text(
                        ' Decryption unsuccessfull! please enter valid password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )));
                  print(e);
                }
              }
              if (_pathpic == null) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Color(0xffee122a),
                    content: Text(
                      'Please select file',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )));
              }
              setState(() {
                _textController.clear();
                _textController1.clear();
              });
            },
            child: Text(
              "Decrypt",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 25,
                  blurRadius: 5,
                  offset: Offset(15, 15), // changes position of shadow
                ),
              ],
              color: Color(0xff282828),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildPasswordRow(),
                // _wfilepath(),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("OR"),
                ),
                _buildAddFileButton(),
                _buildChooseFileButton(),
                _builddecryptButton(),

              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.53,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffee122a),
                      borderRadius: BorderRadius.only(
                      )),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_buildLogo(), _buildContainer()],
            ),
          ],
        ),
        // ),
      ),
    );
  }
}