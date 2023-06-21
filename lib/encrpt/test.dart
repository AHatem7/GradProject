// import 'package:encrypt/encrypt.dart';
//
// void main() {
//   final key = "Your16CharacterK";
//   final plainText = "lorem ipsum example example";
//   Encrypted encrypted = encrypt(key, plainText);
//   String decryptedText = decrypt(key, encrypted);
//   print(decryptedText);
// }
//
// String decrypt(String keyString, Encrypted encryptedData) {
//   final key = Key.fromUtf8(keyString);
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   return encrypter.decrypt(encryptedData, iv: initVector);
// }
//
// Encrypted encrypt(String keyString, String plainText) {
//   final key = Key.fromUtf8(keyString);
//   final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//   final initVector = IV.fromUtf8(keyString.substring(0, 16));
//   Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
//   return encryptedData;
// }




////////////////////////////////////////////////////
// import 'package:crypto/crypto.dart';
// import 'package:encrypt/encrypt.dart';
//
//
// class EncryptData{
// //for AES Algorithms
//
//   static Encrypted? encrypted;
//   static var decrypted;
//
//
//   static encryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     encrypted = encrypter.encrypt(plainText, iv: iv);
//     print(encrypted!.base64);
//   }
//
//   static decryptAES(plainText){
//     final key = Key.fromUtf8('my 32 length key................');
//     final iv = IV.fromLength(16);
//     final encrypter = Encrypter(AES(key));
//     decrypted = encrypter.decrypt(encrypted!, iv: iv);
//     print(decrypted);
//   }
// }
//////////////////////////////////////////////////




import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;




class UploadFile extends StatefulWidget {
  static String routename = 'm';
  const UploadFile({Key? key}) : super(key: key);

  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _downloadUrl;
  String? _fileName;
  encrypt.Key? _key;
  encrypt.IV? _iv;
  String? _password;


  Future<void> _uploadFile(String filePath, String fileName) async {
    // Show a dialog to get the password from the user
    _password = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password'),
          content: TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(_password);
              },
            ),
          ],
        );
      },
    );

    if (_password == null || _password!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final result = await _uploadEncryptedFileToFirebaseStorageAndFirestore(
          filePath, fileName, _password!);
      setState(() {
        _downloadUrl = result['url'];
        _fileName = fileName;
        _key = result['key'];
        _iv = result['iv'];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File uploaded successfully'),
        ),
      );

    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Future<
  //     Map<String, dynamic>> _uploadEncryptedFileToFirebaseStorageAndFirestore(
  //     String filePath,
  //     String fileName,
  //     String password) async {
  //   // Read the contents of the file
  //   final bytes = await File(filePath).readAsBytes();
  //
  //   // Generate a secret key and initialization vector (IV) based on the password
  //   final key = encrypt.Key.fromUtf8(password.substring(0, 32));
  //   final iv = encrypt.IV.fromUtf8(password.substring(32, 48));
  //
  //   // Encrypt the contents of the file using the secret key and IV
  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));
  //   final encrypted = encrypter.encryptBytes(bytes, iv: iv);
  //
  //   // Upload the encrypted file to Firebase Storage
  //   final storageRef = firebase_storage.FirebaseStorage.instance.ref(
  //       'test/$fileName');
  //   final uploadTask = storageRef.putData(encrypted.bytes);
  //   final snapshot = await uploadTask.whenComplete(() => null);
  //
  //   // Get the download URL of the uploaded file
  //   final downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //   // Store the download URL and key/IV in a document in Firestore
  //   final docRef = await firestore.FirebaseFirestore.instance
  //       .collection('test')
  //       .add({'url': downloadUrl, 'key': key.base64, 'iv': iv.base64});
  //
  //   // Delete the encrypted file
  //   await File(filePath).delete();
  //
  //   // Return the key, IV, and download URL
  //   return {'key': key, 'iv': iv, 'url': downloadUrl};
  // }
  ////////////////

  Future<Map<String, dynamic>> _uploadEncryptedFileToFirebaseStorageAndFirestore(
      String filePath,
      String fileName,
      String password) async {
    // Check if password is at least 48 characters long
    if (password.length < 48) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 48 characters long'),
          backgroundColor: Colors.red,
        ),
      );
      return {};
    }

    // Read the contents of the file
    final bytes = await File(filePath).readAsBytes();

    // Generate a secret key and initialization vector (IV) based on the password
    final key = encrypt.Key.fromUtf8(password.substring(0, 32));
    final iv = encrypt.IV.fromUtf8(password.substring(32, 48));

    // Encrypt the contents of the file using the secret key and IV
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encryptBytes(bytes, iv: iv);

    // Upload the encrypted file to Firebase Storage
    final storageRef = firebase_storage.FirebaseStorage.instance.ref(
        'test/$fileName');
    final uploadTask = storageRef.putData(encrypted.bytes);
    final snapshot = await uploadTask.whenComplete(() => null);

    // Get the download URL of the uploaded file
    final downloadUrl = await snapshot.ref.getDownloadURL();

    // Store the download URL and key/IV in a document in Firestore
    final docRef = await firestore.FirebaseFirestore.instance
        .collection('test')
        .add({'url': downloadUrl, 'key': key.base64, 'iv': iv.base64});

    // Delete the encrypted file
    await File(filePath).delete();

    // Return the key, IV, and download URL
    return {'key': key, 'iv': iv, 'url': downloadUrl};
  }

  Future<void> _decryptFile() async {
    if (_password == null || _password!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password cannot be empty'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Download the encrypted file from Firebase Storage
      final http.Response response = await http.get(Uri.parse(
          _downloadUrl!));
      print(_downloadUrl);
      final encryptedBytes = response.bodyBytes;

      // Decrypt the contents of the file using the key and IV
      final key = encrypt.Key.fromUtf8(_password!.substring(0, 32));
      final iv = encrypt.IV.fromUtf8(_password!.substring(32, 48));
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final decrypted = encrypter.decryptBytes(
          encrypt.Encrypted(encryptedBytes), iv: iv);

      // Write the decrypted contents to a new file
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$_fileName';
      await File(filePath).writeAsBytes(decrypted);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File decrypted successfully'),
        ),
      );

      // Open the decrypted file

      await OpenFile.open(filePath);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error decrypting file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                // Show the file picker dialog
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png', 'jpg', 'pdf'],
                );

                // If no file is selected, show a snackbar and return

                if (result == null) {
                  ScaffoldMessenger.of(context).
                  showSnackBar(
                    SnackBar(
                      content: Text('No file selected'),
                    ),
                  );
                  return null;
                }


                // Extract the file path and name from the result object
                final path = result.files.single.path!;
                final fileName = result.files.single.name!;

                // Call the _uploadFile function with the file path and name
                await _uploadFile(path, fileName);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_upload_outlined, size: 100,
                        color: Colors.black),
                    const Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                width: 341,
                height: 341,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            if (_downloadUrl != null && _key != null && _iv != null)
              Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: _decryptFile,
                    child: const Text('Decrypt File'),
                  ),

                ],
              ),

          ],
        ),
      ),
    );
  }
}
