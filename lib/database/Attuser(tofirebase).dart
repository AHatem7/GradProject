class MyUser {
  static const String collectionName = 'users';
  String id;
  String fName;
  String lName;
  String phone;
  String email;
  String department;
  MyUser({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.department,
    required this.email
  });

  MyUser.fomJson(Map<String,dynamic>json):
        this(
          id: json['id'] as String,
          fName: json['fName'] as String,
          lName: json['lName'] as String,
          phone: json['phone'] as String,
          email: json['email'] as String,
          department: json['department'] as String
      );

  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'fName':fName,
      'lName':lName,
      'phone':phone,
      'email':email,
      'department':department
    };
  }

}