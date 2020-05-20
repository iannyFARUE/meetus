import 'package:json_annotation/json_annotation.dart';
part 'device_info.g.dart';




@JsonSerializable()
class DeviceInfo {
  String deviceName;
  String deviceModel;
  String systemName;
  String systemVersion;

  DeviceInfo({
    this.deviceName,
    this.deviceModel,
    this.systemName,
    this.systemVersion,
  });
   factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);
}