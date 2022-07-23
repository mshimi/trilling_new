import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:trilling_web/features/auth/domain/entities/appuser.dart';

class AppUserModel {
  String id;
  String email;
  String password;
  String name;
  String firstName;
  bool isAdmin;
  bool isDeleted;

  AppUserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.isAdmin,
      required this.name,
      required this.password,
      required this.isDeleted});

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
        id: map['id'],
        email: map['email'],
        firstName: map['firstName'],
        isAdmin: map['isAdmin'] as bool,
        name: map['name'],
        password: map['password'],
        isDeleted: map['isDeleted']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'isAdmin': isAdmin,
      'name': name,
      'password': password,
      'isDeleted': isDeleted,
    };
  }

  factory AppUserModel.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> userData) {
    return AppUserModel.fromMap(userData.data()!);
  }

  AppUser toDomain() {
    return AppUser(
        id: id,
        email: email,
        password: password,
        name: name,
        firstName: firstName,
        isDeleted: isDeleted,
        isAdmin: isAdmin);
  }

  factory AppUserModel.fromDomain(AppUser appUser) {
    return AppUserModel(
        id: appUser.id,
        email: appUser.email,
        firstName: appUser.firstName,
        isAdmin: appUser.isAdmin,
        name: appUser.name,
        password: appUser.password,
        isDeleted: appUser.isDeleted);
  }

  AppUserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? firstName,
    bool? isAdmin,
    bool? isDeleted,
  }) {
    return AppUserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        isAdmin: isAdmin ?? this.isAdmin,
        name: name ?? this.name,
        password: password ?? this.password,
        isDeleted: isDeleted ?? this.isDeleted);
  }
}
