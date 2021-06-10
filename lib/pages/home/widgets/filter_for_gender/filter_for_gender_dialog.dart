import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/filter_for_gender/head_filter.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/filter_for_gender/switch_list_tile_gender_filter.dart';
import 'package:interview_gigaservice_flutter/shared/sharedWidgets/sweet_button.dart';
import 'package:interview_gigaservice_flutter/shared/utils/flash.dart';
import 'package:interview_gigaservice_flutter/shared/utils/navigation.dart';

class FilterForGenderDialog extends StatelessWidget {
  final HomeViewModel homeViewModel;

  FilterForGenderDialog(this.homeViewModel);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          HeadFilter(),
          Expanded(child: SwitchListTileParticipants(homeViewModel)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SweetButton(
                  isEnable: true,
                  onPressed: () {
                    bool resultFilter = homeViewModel.filterForGender();
                    if (resultFilter) {
                      navigationBack(context: context);
                    } else {
                      showError(
                          context: context,
                          text:
                              "Por favor, selecione pelo menos um dos gêneros.");
                    }
                  },
                  text: 'Confirmar',
                  icon: Icons.check_circle,
                  textcolor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  color: Colors.white),
              SizedBox(
                width: 20,
              ),
              SweetButton(
                  isEnable: true,
                  onPressed: () {
                    navigationBack(context: context);
                  },
                  text: 'Cancelar',
                  icon: Icons.cancel,
                  textcolor: Colors.red,
                  borderColor: Colors.red,
                  color: Colors.white),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
