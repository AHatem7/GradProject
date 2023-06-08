import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;




  Future<void> uploadFile(
      String filePath,
      String fileName,


      ) async{
    File file = File(filePath);

    try{
      await storage.ref('test/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch(e){
      print(e);
    }
  }


  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results = await storage.ref('test').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    return results;
  }

  Future<String> downloadURl(String fileName) async {
    String downloadURL = await storage.ref('test/$fileName').getDownloadURL();

    return downloadURL;
  }

  // Future<String> _getDownloadUrl(String fileName) async {
  //   final ref = FirebaseStorage.instance.ref().child('uploads/$fileName');
  //   return await ref.getDownloadURL();
  // }
////////////////////////////////////////////////
//   final ref = FirebaseStorage.instance.ref().child('testimage');
// // no need of the file extension, the name will do fine.
//   var url = await ref.getDownloadURL();
//   print(url);
}