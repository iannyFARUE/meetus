// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    id: json['id'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    profilePicUrl: json['profilePicUrl'] as String,
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    gender: json['gender'] == null
        ? null
        : Gender.fromJson(json['gender'] as Map<String, dynamic>),
    mobileNumber: json['mobileNumber'] as String,
    appToken: json['appToken'] as String,
    deviceInfo: json['deviceInfo'] == null
        ? null
        : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePicUrl': instance.profilePicUrl,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender?.toJson(),
      'mobileNumber': instance.mobileNumber,
      'appToken': instance.appToken,
      'deviceInfo': instance.deviceInfo?.toJson(),
    };
