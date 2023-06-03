
import 'package:cloud_firestore/cloud_firestore.dart';
import 'attributes.dart';

class MyDataBase {
  static CollectionReference<Tasks> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Tasks.collectionName)
        .withConverter<Tasks>(fromFirestore: (snapshot, options) {
      return Tasks.fromFireStore(snapshot.data() ?? {});
    }, toFirestore: (task, options) {
      return task.toFireStore();
    });
  }

  static Future<void> addTask(Tasks task) {
    var taskDoc = getTasksCollection()
        .doc();
    //task.dateTime = dateOnly(task.dateTime!);
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }
  static Future<QuerySnapshot<Tasks>> getTasks(
      DateTime dateTime)async{
    var collection = getTasksCollection();
    // .where('dateTime',isEqualTo: dateOnly(dateTime).millisecondsSinceEpoch);
    return collection.get();
  }
  static  Stream<QuerySnapshot<Tasks>>listenForTaskUpdates(){
    var collection = getTasksCollection();
    return collection.snapshots();
  }
  static Future<void>deleteTask(Tasks task){
    var tasksCollection = getTasksCollection();
    var taskRef = tasksCollection.doc(task.id);
    return taskRef.delete();
  }

}