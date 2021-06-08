import 'package:interview_gigaservice_flutter/shared/enums.dart';

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
}
