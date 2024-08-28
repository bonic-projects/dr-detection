import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/services/videosdk_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientViewModel extends BaseViewModel {
  final log = getLogger('patientViewModel');

  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  void logoutUser() {
    _userService.deleteVideoId();
    _userService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.loginRegisterView);
  }

    final ImagePicker _picker = ImagePicker();
  List<Uint8List?> _selectedImages = [];

  List<Uint8List?> get selectedImages => _selectedImages;

  Future<Uint8List?> getImageGallery() async {
    setBusy(true);

    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();

    if (filePickerResult != null) {
      _selectedImages.addAll(filePickerResult.files.map((file) => file.bytes));
      //_selectedImages = filePickerResult.files.first.bytes;
    } else {
      log.e("File Picking eror");
    }

    notifyListeners();

    setBusy(false);
    return null;
  }

  final _videosdkService = locator<VideosdkService>();
  void createVideoCall() async {
    setBusy(true);
    String? m = await _videosdkService.createMeeting();
    if (m != null) {
      log.i("MMMM");
      log.v(m);
      _meetingId = m;
      log.i(meetingId);

      await Future.delayed(const Duration(seconds: 1));
      setBusy(false);
      await _userService.updateUser(AppUser(videoId: m, isVideoOn: true));
      _navigationService.navigateToHomeView(meetingid: meetingId);
    }
  }

  String _meetingId = "";
  String get meetingId => _meetingId;
}
