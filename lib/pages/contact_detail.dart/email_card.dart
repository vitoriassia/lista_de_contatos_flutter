import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/utils/get_color_according_gender.dart';

class EmailCard extends StatelessWidget {
  final Gender gender;
  final String email;
  EmailCard(this.gender, this.email);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
          side: BorderSide(color: getColorAccordingGender(gender), width: 2)),
      child: ListTile(
        leading: Icon(
          Icons.email,
          color: getColorAccordingGender(gender),
          size: 30,
        ),
        title: Text(
          email,
          style: TextStyle(
              color: getColorAccordingGender(gender),
              fontSize: 13.0,
              fontFamily: 'Source Sans Pro'),
        ),
      ),
    );
  }
}
