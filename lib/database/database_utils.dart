import 'package:cloud_firestore/cloud_firestore.dart';
import 'Attuser(tofirebase).dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
        fromFirestore: (snapshot, _) => MyUser.fomJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson());
  }
  static Future<void> createDBUser(MyUser user) async {
    return getUsersCollection().doc(user.id).set(user);
  }
  static Future<MyUser?> readUser(String userId)async{
    var userDocSnapshot = await getUsersCollection()
        .doc(userId)
        .get();
    return userDocSnapshot.data();
  }


 // static Future<QuerySnapshot<MyUser>> getUser(){
 //    return getUsersCollection().get();
 //
 //  }





}
