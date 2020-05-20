import 'package:json_annotation/json_annotation.dart';
import './device_info.dart';
import './gender.dart';

part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  String id;
  String username;
  String password;
  String firstName;
  String lastName;
  String profilePicUrl;
  DateTime dateOfBirth;
  Gender gender;
  String mobileNumber;
  String appToken;
  DeviceInfo deviceInfo;

  AppUser({
    this.id,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.profilePicUrl,
    this.dateOfBirth,
    this.gender,
    this.mobileNumber,
    this.appToken,
    this.deviceInfo,
  });

    factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

     Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
