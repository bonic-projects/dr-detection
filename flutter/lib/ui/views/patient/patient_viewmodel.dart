import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/services/videosdk_service.dart';
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
      await _userService.updateUser(AppUser(videoId: m));
      _navigationService.navigateToHomeView(meetingid: meetingId);
    }
  }

  String _meetingId = "";
  String get meetingId => _meetingId;
}
