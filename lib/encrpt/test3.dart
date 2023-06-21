import 'dart:io';

//import 'package:aes_crypt/aes_crypt.dart';
import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'other.dart';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class DecryptionPage extends StatefulWidget {
  static const routeName = '/decryption';

  @override
  _DecryptionPageState createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  final _textController = TextEditingController();
  bool _validate = false;
  String? _path;
  String? _uploadedFileUrl;


  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final uploadedFileUrl =
    ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decryption Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              _buildAddFileButton(uploadedFileUrl),
              _buildPasswordRow(),
              _buildDecryptButton(uploadedFileUrl),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildAddFileButton() {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 20),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         primary: const Color(0xffDCCDA8),
  //         shape: const StadiumBorder(),
  //       ),
  //       onPressed: () async {
  //         FocusScope.of(context).unfocus();
  //         setState(() {
  //           _validate = false;
  //           _path = null;
  //         });
  //         FilePickerResult? result = await FilePicker.platform.pickFiles();
  //         if (result != null) {
  //           setState(() {
  //             _path = result.files.single.path!;
  //           });
  //         }
  //       },
  //       child: Text(
  //         _path == null ? 'Select File' : 'File Selected',
  //         style: const TextStyle(fontSize: 16),
  //       ),
  //     ),
  //   );
  // }
  //////////////////////////////////////
  // Widget _buildAddFileButton() {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 20),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         primary: const Color(0xffDCCDA8),
  //         shape: const StadiumBorder(),
  //       ),
  //       onPressed: () async {
  //         FocusScope.of(context).unfocus();
  //         setState(() {
  //           _validate = false;
  //           _path = null;
  //         });
  //
  //         try {
  //           final http.Response response = await http.get(Uri.parse(_uploadedFileUrl!));
  //           final Directory? appStorage = await getExternalStorageDirectory();
  //           final File file = File('${appStorage?.path}/file.aes');
  //           await file.writeAsBytes(response.bodyBytes);
  //           setState(() {
  //             _path = file.path;
  //           });
  //         } catch (e) {
  //           print('Error downloading file: $e');
  //         }
  //       },
  //       child: Text(
  //         _uploadedFileUrl == null ? 'Select File' : 'File Selected',
  //         style: const TextStyle(fontSize: 16),
  //       ),
  //     ),
  //   );
  // }
  Widget _buildAddFileButton(uploadedFileUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffDCCDA8),
          shape: const StadiumBorder(),
        ),
        onPressed: () async {
          FocusScope.of(context).unfocus();
          setState(() {
            _validate = false;
            _path = null;
          });

          try {
            final http.Response response = await http.get(Uri.parse(uploadedFileUrl!));
            final Directory? appStorage = await getExternalStorageDirectory();
            final File file = File('${appStorage?.path}/file.aes');
            await file.writeAsBytes(response.bodyBytes);
            setState(() {
              _path = file.path;
            });
          } catch (e) {
            print('Error downloading file: $e');
          }
        },
        child: Text(
          uploadedFileUrl == null ? 'Select File' : 'File Selected',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: true,
        controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Encryption Password',
          errorText: _validate ? 'Password can\'t be empty' : null,
        ),
      ),
    );
  }

  Widget _buildDecryptButton(uploadedFileUrl) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          setState(() {
            _textController.text.isEmpty
                ? _validate = true
                : _validate = false;
          });
          if (_path != null && _textController.text.isNotEmpty) {
            // Creates an instance of AesCrypt class.
            AesCrypt crypt = AesCrypt();

            // Sets encryption password.
            crypt.aesSetMode(AesMode.cbc);
            crypt.setPassword(_textController.text);

            // Sets overwrite mode.
            crypt.setOverwriteMode(AesCryptOwMode.rename);

            try {
              // Decrypts the file and save the decrypted file to a file without
              // the '.aes' extension. In this case it will be '$_path.decrypted'.
              // It returns a path to the decrypted file.
              String decryptedFilePath = crypt.decryptFileSync(uploadedFileUrl!);

              print('The decryption has been completed successfully.');
              print('Decrypted file: $decryptedFilePath');

              final decryptedFile = await saveFilePermanently(decryptedFilePath);
              final fileName = decryptedFile.path.split('/').last;
              final fileBytes = await decryptedFile.readAsBytes();
              final storageRef = FirebaseStorage.instance.ref('test/$fileName');
              final uploadTask = storageRef.putData(fileBytes);

              await uploadTask.whenComplete(() async {
                _uploadedFileUrl = await storageRef.getDownloadURL();
                print('File upload success. URL: $_uploadedFileUrl');
                Navigator.pushNamed(
                  context,
                  DownloadPage.routeName,
                  arguments: _uploadedFileUrl,
                );
              });

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color(0xff006aff),
                  content: Text(
                    ' File Decryption Success',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color(0xff006aff),
                  content: Text(
                    ' File Saved',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )));
            } on AesCryptException catch (e) {
              print('The decryption has been completed unsuccessfully.');
              print(e.message);
            }
          }
          if (_path == null) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                backgroundColor: Color(0xffee122a),
                content: Text(
                  'Please select file',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )));
          }
        },
        child: const Text('Decrypt'),
      ),
    );
  }

  Future<File> saveFilePermanently(String file) async {
    final appStorage = await getExternalStorageDirectory();
    final newFile = File('${appStorage!.path}/${file.split('/').last}');
    return File(file).copy(newFile.path);
  }
}