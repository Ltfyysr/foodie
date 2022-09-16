import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../entity/users.dart';

class UserRepository {
  Future<Users> getUser(String id) async {
    var db = FirebaseFirestore.instance;

    final ref = await db.collection("users").doc(id).get();
    final user = ref.data();
    final userMapped = Users.fromJson(user!);
    return userMapped;
  }

  Future<String> getUserId() async {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> getUserName() async {
    var userAuth = FirebaseAuth.instance.currentUser!.uid;
    var db = FirebaseFirestore.instance;
//
    final ref = await db.collection("users").doc(userAuth).get();
    final user = ref.data();
    final userMapped = Users.fromJson(user!);


    return userMapped.userName;
  }
}