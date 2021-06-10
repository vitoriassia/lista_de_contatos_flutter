import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/utils/get_color_according_gender.dart';

class GenderIndicator extends StatelessWidget {
  final Gender gender;
  GenderIndicator(this.gender);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
          side: BorderSide(color: getColorAccordingGender(gender), width: 2)),
      child: Container(
          width: 100,
          height: 30,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == Gender.male ? Icons.male : Icons.female,
                size: 30,
                color: getColorAccordingGender(gender),
              ),
              Text(
                gender == Gender.male ? "Homem" : "Mulher",
                style: TextStyle(
                    color: getColorAccordingGender(gender),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro'),
              ),
            ],
          )),
    );
  }
}
