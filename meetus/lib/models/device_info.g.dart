// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return DeviceInfo(
    deviceName: json['deviceName'] as String,
    deviceModel: json['deviceModel'] as String,
    systemName: json['systemName'] as String,
    systemVersion: json['systemVersion'] as String,
  );
}

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'deviceModel': instance.deviceModel,
      'systemName': instance.systemName,
      'systemVersion': instance.systemVersion,
    };
