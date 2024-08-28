import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/ui/views/login/login_view.form.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');

  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _snackBarService = locator<SnackbarService>();

  //String? get node => _userService.user?.userRole ?? " no role";

  void onModelReady() {}

  void authenticateUser() async {
    if (isFormValid && emailValue != null && passwordValue != null) {
      setBusy(true);
      log.i("email and pass valid");
      log.i(emailValue!);
      log.i(passwordValue!);
      FirebaseAuthenticationResult result =
          await _firebaseAuthenticationService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
      if (result.user != null) {
        await _userService.fetchUser();
        if (_userService.user!.userRole == "patient") {
          _navigationService.pushNamedAndRemoveUntil(Routes.patientView);
        } else {
          _navigationService.pushNamedAndRemoveUntil(Routes.doctorView);
        }
        // Await fetchUser() if needed
      } else {
        log.e("Error: ${result.errorMessage}");

        _snackBarService.showSnackbar(
            message:
                "Error: ${result.errorMessage ?? "Enter valid credentials"}");
      }
    }
    setBusy(false);
  }

  void logoutUser() {
    _userService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.loginRegisterView);
  }
}
