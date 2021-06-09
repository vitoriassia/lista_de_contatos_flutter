import 'package:interview_gigaservice_flutter/shared/enums.dart';

Gender genderStringToEnum(String gengerString) {
  return gengerString == "male" ? Gender.male : Gender.female;
}
