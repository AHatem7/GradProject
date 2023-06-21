import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class EncryptFile extends StatefulWidget {
  static String routename = 'encrypt';
  const EncryptFile({Key? key}) : super(key: key);

  @override
  _EncryptFileState createState() => _EncryptFileState();
}

class _EncryptFileState extends State<EncryptFile> {
  String? _fileName;
  encrypt.Key? _key;
  encrypt.IV? _iv;
  String? _password;

  Future<void> _encryptFile(String filePath, String fileName) async {
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
      final result = await _encryptAndUploadFileToFirebaseStorageAndFirestore(
          filePath, fileName, _password!);
      setState(() {
        _fileName = fileName;
        _key = result['key'];
        _iv = result['iv'];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('File encrypted and uploaded successfully'),
        ),
      );

    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error encrypting and uploading file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _encryptAndUploadFileToFirebaseStorageAndFirestore(
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

    // Return the key and IV
    return {'key': key, 'iv': iv};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encrypt File'),
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

                if (result == null || result.files.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file selected'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                // Encrypt the selected file
                final filePath = result.files.single.path!;
                final fileName = result.files.single.name!;
                await _encryptFile(filePath, fileName);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: const Text(
                  'Select File',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_fileName != null)
              Text(
                'File name: $_fileName',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 8),
            if (_key != null && _iv != null)
              Column(
                children: [
                  Text(
                    'Key: ${_key!.base64}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'IV: ${_iv!.base64}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}