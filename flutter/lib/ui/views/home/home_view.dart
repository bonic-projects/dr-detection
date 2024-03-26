import 'package:diabeticretinopathydetection/ui/widgets/meeting_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final String meetingid;
  HomeView({Key? key, required this.meetingid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      // onModelReady: (model) => model.createVideoCall(), // Call createVideoCall on model ready
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          actions: [
            PopScope(
                canPop: false,
                onPopInvoked: (bool value) {
                  return model.alertdialog();
                },
                child: TextButton(
                    onPressed: model.alertdialog,
                    child: const Text(
                      'Stop calling',
                      style: TextStyle(color: Colors.red),
                    )))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: model.isBusy
                ? const CircularProgressIndicator() // Show a loader while busy
                : Expanded(
                  child: MeetingScreen(
                      meetingId: meetingid,
                      token: model.sdkToken,
                    ),
                ),
          ),
        ),
      ),
    );
  }
}
