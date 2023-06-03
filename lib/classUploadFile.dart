
import 'package:firebase_database/firebase_database.dart';
class Uploadfiledata {
  String id;
  String name;
  String describtion;

  Uploadfiledata({this.id: '', required this.name, required this.describtion});

  Map<String, dynamic> toJson() {
//    '{"title":"Flutter assignment","description":"write firestore"}'
    return {
      "id": id,
      "name": name,
      "description": describtion,};
  }
  Uploadfiledata.fromJson(Map<String,dynamic> json):
        this( id : json['id'] as String,
          name:json['name'] as String,
          describtion : json["description"] as String,
      );

}
