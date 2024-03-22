import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'aler_widget_viewmodel.dart';

class AlerWidgetView extends StackedView<AlerWidgetViewModel> {
  const AlerWidgetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AlerWidgetViewModel viewModel,
    Widget? child,
  ) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text(
        'Are you sure you want to stop video calling?',
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: 
            viewModel.popPop,
          child: const Text('No')
          
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: 
            viewModel.popback,
          child: const Text('Yes')
          
        ),
      ],
    );
  }

  @override
  AlerWidgetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AlerWidgetViewModel();
}
