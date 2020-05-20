// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    id: json['id'] as String,
    isAdmin: json['is_admin'] as bool,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_admin': instance.isAdmin,
    };
