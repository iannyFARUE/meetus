import 'package:json_annotation/json_annotation.dart';
part 'gender.g.dart';




@JsonSerializable()
class Gender{

  String id;
  String name;

  Gender({this.id,this.name});

  factory Gender.fromJson(Map<String,dynamic> json) => _$GenderFromJson(json);

   Map<String, dynamic> toJson() => _$GenderToJson(this);

   static List<Gender> getGenders(){

     return <Gender>[
     Gender(id:"1",name:"Male"),
     Gender(id:"2",name:"Female"),
     ];
   }
}