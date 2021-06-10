import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/shared/constants.dart';

class SearchContactForNameWidget extends StatelessWidget {
  final Function(String) onChange;
  SearchContactForNameWidget(this.onChange);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChange,
        decoration: kInputDecorationSearchParticipant.copyWith(
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4)),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 21,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
