import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:interview_gigaservice_flutter/shared/constants.dart';

class SwitchListTileParticipants extends StatelessWidget {
  final HomeViewModel homeViewModel;
  SwitchListTileParticipants(this.homeViewModel);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SwitchListTile(
            title: Text(
              "Masculino",
              style: kTitleBlack.copyWith(fontSize: 17),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: homeViewModel.filterGenderMale.isSelected,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (newvalue) {
              homeViewModel.setGenderSelectMale(newvalue);
              setState(() {});
            },
          ),
          SwitchListTile(
            title: Text(
              "Feminino",
              style: kTitleBlack.copyWith(fontSize: 17),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: homeViewModel.filterGenderFemale.isSelected,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (newvalue) {
              homeViewModel.setGenderSelectFemale(newvalue);
              setState(() {});
            },
          )
        ]),
      );
    });
  }
}
