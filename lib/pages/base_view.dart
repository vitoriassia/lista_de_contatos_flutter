import 'package:interview_gigaservice_flutter/core/services/locator.dart';
import 'package:interview_gigaservice_flutter/pages/base_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final Function(T)? onViewModelReady;
  BaseView({required this.builder, this.onViewModelReady});
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = locator<T>();
  @override
  void initState() {
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }

  @override
  void dispose() {
    try {
      viewModel.dispose();
    } catch (e) {}
    super.dispose();
  }
}
