import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/services/videosdk_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DoctorViewModel extends BaseViewModel {
  final log = getLogger('DeviceControlWidget');

  final _userService = locator<UserService>();
//  final _firestoreService = locator<FirestoreService>();
  final _navigationService = locator<NavigationService>();
  final _videosdkService = locator<VideosdkService>();

  void logout() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _userService.logout();
    _navigationService.replaceWithLoginRegisterView();
  }

// List to store users data
  List<AppUser> _users = [];
  List<AppUser> get users => _users;

  //final _meetingId = "";
  String get meetingId => users.first.videoId.toString();

  //Method to fetch user data
  Future<void> fetchUserData() async {
    setBusy(true); // Set ViewModel state to busy
    try {
      AppUser? userWithVideoId = await _userService.fetchVideoIdUser();
      log.v(userWithVideoId);
      if (userWithVideoId != null) {
        // If a user with videoId is found, add it to the list of users
        _users = [userWithVideoId];
        log.v(_users);
        String? meetingId = users.first.videoId;
      } else {
        // If no user with videoId is found, clear the list
        _users.clear();
        log.v(_users);
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
    setBusy(false); // Set ViewModel state to not busy
  }

  void openVideo() {
    _videosdkService.token;
    _videosdkService.validateMeetingId(meetingId);

    _navigationService.navigateToHomeView(meetingid: meetingId);
    log.i(meetingId);
  }

  String get sdkToken => _videosdkService.token;

  bool get isValidMeetingId => _videosdkService.validateMeetingId(meetingId);
}
