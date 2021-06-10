import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';

Color getColorAccordingGender(Gender gender) {
  return gender == Gender.male ? Colors.blue : Colors.pink;
}
