import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactTileWidget extends StatelessWidget {
  final ContactModel contactModel;
  ContactTileWidget({required this.contactModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: ListTile(
        title: Text(contactModel.name),
        subtitle: Text(contactModel.email),
        trailing: Icon(Icons.open_in_new),
        leading: CircleAvatar(
          radius: 30,
          foregroundImage: AssetImage(contactModel.photo),
        ),
      ),
    );
  }
}
