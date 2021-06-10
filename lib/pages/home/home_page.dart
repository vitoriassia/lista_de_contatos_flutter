import 'package:interview_gigaservice_flutter/pages/base_view.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/filter_for_gender/filter_for_gender_button.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/list_contacts_widget.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/search_for_name.dart';
import 'package:interview_gigaservice_flutter/shared/enums.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Contatos"),
      ),
      body: Center(
        child: BaseView<HomeViewModel>(
            onViewModelReady: (model) => model.getContacts(),
            builder: (context, model, _) => model.state == ViewState.busy
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: SearchContactForNameWidget(
                                  model.filterParticipantWithTextField)),
                          FilterForGenderButton()
                        ],
                      ),
                      model.listContacts.isNotEmpty
                          ? Expanded(
                              child: ListContactsWidget(
                                listContacts: model.listContacts,
                              ),
                            )
                          : Container(
                              child: Text(
                                "Não há contatos cadastrados",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                    ],
                  )),
      ),
    );
  }
}
