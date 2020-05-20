import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Member {
  String id;
  String name;
  bool isAdmin;

  Member({this.id, this.isAdmin, this.name});

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
