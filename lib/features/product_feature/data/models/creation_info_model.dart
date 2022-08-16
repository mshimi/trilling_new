import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:trilling_web/features/product_feature/domain/entities/creationinfo.dart';

class CreationInfoModel extends Equatable {
final  String userName;
final  String userId;
 final DateTime creationDate;
const  CreationInfoModel({
    required this.userName,
    required this.userId,
    required this.creationDate,
  });

  CreationInfoModel copyWith({
    String? userName,
    String? userId,
    DateTime? creationDate,
  }) {
    return CreationInfoModel(
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userId': userId,
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory CreationInfoModel.fromMap(Map<String, dynamic> map) {
    return CreationInfoModel(
      userName: map['userName'] ?? '',
      userId: map['userId'] ?? '',
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreationInfoModel.fromJson(String source) =>
      CreationInfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CreationInfoModel(userName: $userName, userId: $userId, creationDate: $creationDate)';

  @override
  List<Object> get props => [userName, userId, creationDate];

  CreationInfo toDomain() {
    return CreationInfo(
        userName: userName, userId: userId, creationDate: creationDate);
  }

  factory CreationInfoModel.fromDomain(CreationInfo creationInfo) {
    return CreationInfoModel(
        userName: creationInfo.userName,
        userId: creationInfo.userId,
        creationDate: creationInfo.creationDate);
  }
}
