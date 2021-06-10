import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/utils/gender_string_to_enum.dart';

class ContactModel {
  String name;
  String email;
  String photo;
  Gender gender;

  ContactModel(
      {required this.name,
      required this.photo,
      required this.email,
      required this.gender});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      name: json["name"]["first"] + " " + json["name"]["last"],
      photo: json["picture"]["large"],
      email: json["email"],
      gender: genderStringToEnum(json["gender"]));
}
