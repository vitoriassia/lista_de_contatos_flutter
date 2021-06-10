import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:interview_gigaservice_flutter/pages/home/widgets/filter_for_gender/filter_for_gender_dialog.dart';
import 'package:interview_gigaservice_flutter/shared/sharedWidgets/default_app_dialog.dart';
import 'package:interview_gigaservice_flutter/shared/utils/dialog_transition.dart';
import 'package:provider/provider.dart';

class FilterForGenderButton extends StatelessWidget {
  FilterForGenderButton();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, model, _) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      dialogTransitionScale(context,
                          child: DefaultAppDialog(
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: FilterForGenderDialog(model),
                          ));
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  )),
            ));
  }
}
