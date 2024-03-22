import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'doctor_viewmodel.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoctorViewModel>.reactive(
      viewModelBuilder: () => DoctorViewModel(),
      onViewModelReady: (model) => model.fetchUserData(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Doctor View'),
            actions: [
              IconButton(
                onPressed: viewModel.logout,
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: viewModel.isBusy
              ? const Center(child: CircularProgressIndicator())
              : InkResponse(
                  onTap: () {
                    viewModel.openVideo();
                  },
                  child: _buildUserCards(viewModel.users)),
        );
      },
    );
  }

  Widget _buildUserCards(List<AppUser> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return InkResponse(
          onTap: () {},
          child: Card(
            child: ListTile(
              title: Text(user.fullName ?? 'No Name'),
              subtitle: Text(user.videoId ?? 'No Video ID'),
            ),
          ),
        );
      },
    );
  }
}