import 'package:interview_gigaservice_flutter/core/services/api.dart';
import 'package:interview_gigaservice_flutter/core/services/locator.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';

class HomeRepository {
  final Api _api = locator<Api>();
  Future<List<ContactModel>> getContacts({int? page}) async {
    var response = await _api.getDataFrom(
        "?format=json&results=15&page=${page ?? 1}&inc=gender,name,email,picture&nat=br");

    List<ContactModel> newList = response.data["results"]
        .map<ContactModel>((contact) => ContactModel.fromJson(contact))
        .toList();
    return newList;
  }
}
