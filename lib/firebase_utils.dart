import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/testUploadFileDB.dart';
import 'classUploadFile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

CollectionReference<Uploadfiledata> getTasksCollection(){
  var typedCollection = FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<Uploadfiledata>(
      fromFirestore:(snapshot, options) => Uploadfiledata.fromJson(snapshot.data()!) ,
      toFirestore: (task,options)=>task.toJson());
  return typedCollection;
}
void addFileToFireBase (Uploadfiledata task){
  var collection = getTasksCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  docRef.set(task);

}

// Future<void> addFileToFirestore(Uploadfiledata task){
//   var collection = getTasksCollection();
//   var docRef = collection.doc();
//   task.id = docRef.id;
//   return docRef.set(task);
// }

