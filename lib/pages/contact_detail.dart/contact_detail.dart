import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/pages/contact_detail.dart/email_card.dart';
import 'package:interview_gigaservice_flutter/pages/contact_detail.dart/gender_indicator.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';
import 'package:interview_gigaservice_flutter/shared/utils/getColorAccordingGender.dart';

class ContactDetailPage extends StatelessWidget {
  final ContactModel contactModel;
  ContactDetailPage(this.contactModel);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorAccordingGender(contactModel.gender),
        centerTitle: true,
        title: Text("Detalhe do Contato"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
              side: BorderSide(
                  color: contactModel.gender == Gender.male
                      ? Colors.blue
                      : Colors.pink,
                  width: 2)),
          elevation: 10,
          child: Container(
            width: 300,
            height: 300,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 45,
                  foregroundImage: NetworkImage(contactModel.photo),
                ),
                Column(
                  children: [
                    Text(
                      contactModel.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GenderIndicator(contactModel.gender)
                  ],
                ),
                EmailCard(contactModel.gender, contactModel.email)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
