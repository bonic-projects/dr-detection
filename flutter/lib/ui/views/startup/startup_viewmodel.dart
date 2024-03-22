import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupviewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  // final RegulaService _regulaService = RegulaService();

  // Place anything here that needs to happen before we get into the application

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    if (_userService.hasLoggedInUser) {
      await _userService.fetchUser();
      _navigationService.replaceWithPatientView();
    } else {
      await Future.delayed(const Duration(seconds: 1));
      _navigationService.replaceWithLoginRegisterView();
    }
  }
}
