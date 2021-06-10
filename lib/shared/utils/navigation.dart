import 'package:flutter/material.dart';
import 'package:interview_gigaservice_flutter/shared/utils/animation_transition.screen.dart';

void navigationTowithAnimation({required context, required page}) {
  print("Navigation with Animation to : ${page.toString()}");
  Navigator.push(
    context,
    ScaleRoute(
      page: page,
    ),
  );
}

void navigationTowithAnimationRemoveUtils({required context, required page}) {
  print("Navigation Remove Until with Animation to : ${page.id}");
  Navigator.pushAndRemoveUntil(
    context,
    ScaleRoute(
      page: page,
    ),
    (r) => false,
  );
}

void navigationTo({required context, required page}) {
  print("Navigation pushNamed to : $page");
  Navigator.pushNamed(context, page);
}

void navigationToRemoveUtils({required context, required page}) {
  print("Navigation Remove Util to : $page");
  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
}

void navigationBack({required context}) {
  print("Navigation Back");
  Navigator.of(context).pop();
}
