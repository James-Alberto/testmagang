// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['isActive'] as bool?,
      json['loyaltyPoints'] as int?,
      json['fitnessGoal'] as int?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isActive': instance.isActive,
      'loyaltyPoints': instance.loyaltyPoints,
      'fitnessGoal': instance.fitnessGoal,
      'id': instance.id,
    };
