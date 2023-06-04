import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String avatar;
  final String password;
  final int quiz_h0_attempts;
  final int quiz_k7_attempts;
  final int quiz_k9_attempts;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.avatar,
    required this.password,
    required this.quiz_h0_attempts,
    required this.quiz_k7_attempts,
    required this.quiz_k9_attempts,
  });

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserModel(
      uid: data['uid'],
      name: data['name'],
      email: data['email'],
      avatar: data['avatar'],
      password: data['password'],
      quiz_h0_attempts: data['quiz_hijaiyah0_attempts'],
      quiz_k7_attempts: data['quiz_kosakata7_attempts'],
      quiz_k9_attempts: data['quiz_kosakata9_attempts'],
    );
  }

  toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "avatar": avatar,
      "password": password,
      "quiz_hijaiyah0_attempts": quiz_h0_attempts,
      "quiz_kosakata7_attempts": quiz_k7_attempts,
      "quiz_kosakata9_attempts": quiz_k9_attempts,
    };
  }
}
