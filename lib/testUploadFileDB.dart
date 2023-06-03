import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class testUploadDB extends StatefulWidget {

  static String routename = 'testDB';

  @override
  _testUploadDBState createState() => _testUploadDBState();
}

class _testUploadDBState extends State<testUploadDB> {
  File? _file;
  //PlatformFile? _platformFile;
  final picker = ImagePicker();
  final filePicker = FilePicker.platform;
  final storage = FirebaseStorage.instance;
  String? _fileName;
  String? _fileDescription;

  PermissionStatus _storagePermissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _checkStoragePermission();
  }

  Future<void> _checkStoragePermission() async {
    final status = await Permission.storage.status;
    setState(() {
      _storagePermissionStatus = status;
    });
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    setState(() {
      _storagePermissionStatus = status;
    });
  }

  Future<void> _uploadFile() async {
    if (_file == null|| _fileName == null || _fileDescription == null) return;

    final fileName = path.basename(_file!.path);
    final destination = 'uploads/$fileName';

    final metadata = SettableMetadata(
      customMetadata: {
        'filename': _fileName!,
        'description': _fileDescription!,
      },
    );

    try {
      // Upload file to Firebase Storage
      await storage.ref(destination).putFile(_file!, metadata);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('File uploaded successfully'),
      ));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error uploading file: $e'),
      ));
    }
  }

  // Future<void> _pickImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _file = File(pickedFile.path);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('No image selected'),
  //       ));
  //     }
  //   });
  // }

  Future<void> _pickFile() async {
    final result = await filePicker.pickFiles();

    if (result == null || result.files.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No file selected'),
      ));
      return;
    }

    setState(() {
      _file = File(result.files.single.path!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _storagePermissionStatus == PermissionStatus.granted
                ? _file != null
                //? Image.file(_file!)
                ? _file!.path.endsWith('.jpg') || _file!.path.endsWith('.jpeg') || _file!.path.endsWith('.png')
                ? Image(image: AssetImage('assets/images/BG1.png'), height: 200.0, width: 200.0)
                : Icon(Icons.file_copy, size: 100.0)

                : Icon(Icons.cloud_upload_outlined, size: 200,)
                : Text('Storage permission not granted'),
            // ElevatedButton(
            //   onPressed: _storagePermissionStatus == PermissionStatus.granted
            //       ? _pickImage
            //       : _requestStoragePermission,
            //   child: Text('Select Image'),
            // ),
            ElevatedButton(
              onPressed: _storagePermissionStatus == PermissionStatus.granted
                  ? _pickFile
                  : _requestStoragePermission,

              child: Text('Select File'),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter new file name',
              ),
              onChanged: (value) {
                setState(() {
                  _fileName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter file description',
              ),
              onChanged: (value) {
                setState(() {
                  _fileDescription = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _storagePermissionStatus == PermissionStatus.granted
                  ? _uploadFile
                  : _requestStoragePermission,
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}









// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////////////////////////////////////////////

             //// SHA8AL SWR ////////

// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
//
//
//
// class  testup extends StatefulWidget {
//   static String routename='j';
//   @override
//   _testupState createState() => _testupState();
// }
//
// class _testupState extends State<testup> {
//   File? _imageFile;
//   final picker = ImagePicker();
//   final storage = FirebaseStorage.instance;
//
//   Future<void> _uploadFile() async {
//     if (_imageFile == null) return;
//
//     final fileName = _imageFile!.path.split('/').last;
//     final destination = 'uploads/$fileName';
//
//     try {
//       // Upload file to Firebase Storage
//       await storage.ref(destination).putFile(_imageFile!);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('File uploaded successfully'),
//       ));
//     } on FirebaseException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error uploading file: $e'),
//       ));
//     }
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _imageFile = File(pickedFile.path);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('No image selected'),
//         ));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _imageFile != null
//                 ? Image.file(_imageFile!)
//                 : Icon(Icons.image),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Select Image'),
//             ),
//             ElevatedButton(
//               onPressed: _uploadFile,
//               child: Text('Upload Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////////////



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
//
//
//
// final FirebaseStorage storage = FirebaseStorage.instance;
//
//
//
// class MyHomePage extends StatefulWidget {
//   static String routename ='test';
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late String _downloadUrl='';
//
//   Future<void> _uploadFile() async {
//     String filePath = '/path/to/file';
//     String downloadUrl = await uploadFile(filePath);
//     setState(() {
//       _downloadUrl = downloadUrl;
//     });
//     print('File uploaded to: $_downloadUrl');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Firebase Storage Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _uploadFile,
//               child: Text('Upload File'),
//             ),
//             _downloadUrl != true
//                 ? Text('Download URL: $_downloadUrl')
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Future<String> uploadFile(String filePath) async {
//   String fileName = basename(filePath);
//   Reference reference = storage.ref().child('uploads/$fileName');
//   File file = File(filePath);
//   UploadTask uploadTask = reference.putFile(file);
//   TaskSnapshot taskSnapshot = await uploadTask;
//   return await taskSnapshot.ref.getDownloadURL();
// }


///////////////////////////////////////////////////////////////////////////////////////////////


// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as Path;
//
//
// class MyHomePage extends StatefulWidget {
//   static String routename='ll';
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late File _file;
//
//   Future uploadFile() async {
//     if (_file != null) {
//       // Create a reference to the file you want to upload
//       String fileName = Path.basename(_file.path);
//       Reference ref = FirebaseStorage.instance.ref().child("files/$fileName");
//
//       // Upload the file data
//       UploadTask uploadTask = ref.putFile(_file);
//
//       // Monitor the upload progress
//       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
//         double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
//         print('Upload is $progress% done');
//       });
//
//       // Wait for the upload to complete
//       TaskSnapshot taskSnapshot = await uploadTask;
//
//       // Handle the upload completion
//       if (taskSnapshot.state == TaskState.success) {
//         // Get the download URL for the uploaded file
//         String downloadUrl = await ref.getDownloadURL();
//         print('File uploaded successfully: $downloadUrl');
//         setState(() {
//           _file = '' as File;
//         });
//       } else {
//         throw Exception('File upload failed');
//       }
//     }
//   }
//
//   Future chooseFile() async {
//     try {
//       final path = await FilePicker.platform.getDirectoryPath();
//       final file = File('$path/example.txt');
//       await file.writeAsString('Hello, world!');
//       setState(() {
//         _file = file;
//       });
//     } catch (e) {
//       print('Error picking file: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Firebase Storage Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _file == true
//                 ? Text('No file selected')
//                 : Text(_file.path),
//             SizedBox(height: 20),
//            ElevatedButton(
//               child: Text('Choose File'),
//               onPressed: chooseFile,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text('Upload File'),
//               onPressed: uploadFile,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


////////////////////////////////////////////////////////////////////////////////////


// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Text('Error in Firebase Initilisation');
//         }
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: 'College App',
//             home: HomePage1(),
//           );
//         }
//         // Otherwise, show something whilst waiting for initialization to complete
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }