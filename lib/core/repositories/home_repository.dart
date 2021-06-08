import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';

class HomeRepository {
  Future<List<ContactModel>> getContacts() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ContactModel(
          name: 'Mark Zuckerberg',
          photo: 'assets/mark.jpg',
          email: 'CEO Facebook',
          gender: Gender.male),
      ContactModel(
          name: "Bill Gates",
          photo: "assets/bill-gates.jpg",
          gender: Gender.male,
          email: "CEO Microsoft"),
      ContactModel(
          name: "Elon Musk",
          photo: "assets/elon.jpg",
          email: "CEO Tesla",
          gender: Gender.male),
      ContactModel(
          name: "Steve Jobs",
          photo: "assets/steve.jpg",
          email: "CEO Apple",
          gender: Gender.male),
    ];
  }
}
