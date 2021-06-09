import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/contact_tile_widget.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';

class ListContactsWidget extends StatelessWidget {
  final List<ContactModel> listContacts;
  ListContactsWidget({required this.listContacts});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: listContacts
                  .map((contact) => ContactTileWidget(contactModel: contact))
                  .toList()),
        ),
      ),
    );
  }
}
