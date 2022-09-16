import 'package:cloud_firestore/cloud_firestore.dart';

class Users{
  String email;
  String userName;
  DateTime timeStamp;

  Users(
      {
        required this.email,
        required this.userName,
        required this.timeStamp});

  Map<String, dynamic> toJson() => {
    'email': email,
    'userName': userName,
    'timeStamp': timeStamp
  };
  static Users fromJson(Map<String, dynamic> json) => Users(
      email: json['email'],
      userName: json['userName'],
      timeStamp: new DateTime.now());

  factory Users.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Users(
        email: data?["email"],
        userName: data?["userName"],
        timeStamp: data?["timeStamp"]
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) "email": email,
      if (userName != null) "userName": userName,
      if (timeStamp != null) "timeStamp": timeStamp,
    };
  }
}