import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NewUser extends Equatable{

  const NewUser({
    required this.uid,
    required this.fullName,
    required this.avatar,
    required this.email,
    required this.password,
    required this.isEmailVerified,
    required this.createdAt,
    required this.updatedAt,
});

  final String uid;
  final String fullName;
  final String avatar;
  final String email;
  final String password;
  final bool isEmailVerified;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  NewUser copyWith({
    String? uid,
    String? fullName,
    String? avatar,
    String? email,
    String? password,
    bool? isEmailVerified,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return NewUser(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory NewUser.fromMap(Map<String, dynamic> map){
    return NewUser(
        uid: map['uid'] as String,
        fullName: map['fullName'] as String,
        avatar: map['avatar'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        isEmailVerified: map['isEmailVerified'] as bool,
        createdAt: map['createdAt'] as Timestamp,
        updatedAt: map['updatedAt'] as Timestamp,
    );
  }


  Map<String, dynamic>toMap(){
    return {
      'uid': uid,
      'fullName': fullName,
      'avatar': avatar,
      'email': email,
      'password': password,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt,
      'updatedAt': createdAt,
    };
  }

  String toJson()=> json.encode(toMap());
  factory NewUser.fromJson(String source)=> NewUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString(){
    return 'NewUser(uid: uid, fullName: fullName, avatar: avatar, email: email, password: password, isEmailVerified: isEmailVerified, createdAt: createdAt, updatedAt: updatedAt)';
  }
  @override
  List<Object?> get props => [
    uid,
    fullName,
    avatar,
    email,
    password,
    isEmailVerified,
    createdAt,
    updatedAt,
  ];


}
