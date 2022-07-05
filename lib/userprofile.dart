import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'userprofile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserProfile {
  String? firstName;
  String? lastName;
  bool? isActive;
  int? loyaltyPoints;
  int? fitnessGoal;
  String? id;

  UserProfile(this.firstName, this.lastName, this.isActive, this.loyaltyPoints,
      this.fitnessGoal);

  // String toJson() {
  //   Map<String, dynamic> userMap = {
  //     'firstName': this.firstName,
  //     'lastName': this.lastName,
  //     'loyaltyPoints': this.loyaltyPoints,
  //     'fitnessGoal': this.fitnessGoal,
  //     'isActive': this.isActive
  //   };
  //   var data = jsonEncode(userMap);
  //   return data;
  // }

  String toJson() {
    Map<String, dynamic> userMap = _$UserProfileToJson(this);
    var userJson = jsonEncode(userMap);
    return userJson;
  }

  // factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
  //       json['firstName'] as String?,
  //       json['lastName'] as String?,
  //       json['isActive'] as bool?,
  //       json['loyaltyPoints'] as int?,
  //       json['fitnessGoal'] as int?,
  //     );

  factory UserProfile.fromJson(Map<String, dynamic> userMap) {
    return _$UserProfileFromJson(userMap);
  }
}
