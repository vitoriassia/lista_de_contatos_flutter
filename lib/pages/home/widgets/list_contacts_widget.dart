import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/contact_tile_widget.dart';
import 'package:interview_gigaservice_flutter/shared/models/contact_model.dart';
import 'package:provider/provider.dart';

class ListContactsWidget extends StatelessWidget {
  final List<ContactModel> listContacts;
  ListContactsWidget({required this.listContacts});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, _) => Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification? scrollInfo) {
              if (conditionForLoadingMore(model, scrollInfo)) {
                model.getMoreContacts();
                return true;
              } else {
                return false;
              }
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: listContacts
                          .map((contact) =>
                              ContactTileWidget(contactModel: contact))
                          .toList()),
                  Container(
                    height: model.loadingMore ? 40.0 : 0,
                    color: Colors.transparent,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  conditionForLoadingMore(model, scrollInfo) {
    return !model.loadingMore &&
        scrollInfo!.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse;
  }
}
