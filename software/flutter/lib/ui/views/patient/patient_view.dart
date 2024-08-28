import 'package:diabeticretinopathydetection/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'patient_viewmodel.dart';

class PatientView extends StackedView<PatientViewModel> {
  const PatientView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient'),
        actions: [
          IconButton(
              onPressed: viewModel.logoutUser, icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: viewModel.getImageGallery,
                  child: const Text("Select file")),
                  verticalSpaceMedium,
              ElevatedButton(
                onPressed: viewModel.createVideoCall,
                child: const Text('Create Meeting'),
              ),
              verticalSpaceMedium,
              Expanded(
                      child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        
                          itemCount: viewModel.selectedImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              height: 120,
                              width: 123,
                              child: Image.memory(
                                
                                fit: BoxFit.cover,
                                  viewModel.selectedImages[index]!),
                            );
                            // Image.file(
                            //   File(viewModel.selectedImages[index].path),
                            //   fit: BoxFit.cover,
                            // );
                          }),
                    ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  PatientViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PatientViewModel();
}
