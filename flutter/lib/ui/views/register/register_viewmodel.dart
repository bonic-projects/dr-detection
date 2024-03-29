import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.logger.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/models/appuser.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/ui/views/register/register_view.form.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final log = getLogger('RegisterViewModel');
  final _userService = locator<UserService>();

  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();

  // late String _userRole;
  // String get userRole => _userRole;

  void onModelReady() {
    // _userRole = userRole;
  }

  void registerUser() async {
    if (
        // (_userRole == "doctor" &&
        isFormValid && hasEmail && hasUserRole && hasPassword && hasName
        // hasAge &&
        // hasGender
        // ||
        // !hasNameValidationMessage &&
        //     !hasAgeValidationMessage &&
        //     !hasGenderValidationMessage &&
        //     !hasEmailValidationMessage &&
        //     !hasPasswordValidationMessage &&
        //     hasEmail &&
        //     hasPassword &&
        //     hasName &&
        //     hasAge &&
        //     hasGender
        ) {
      setBusy(true);
      log.i("email and pass valid");
      log.i(emailValue!);
      log.i(passwordValue!);
      FirebaseAuthenticationResult result =
          await _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
      if (result.user != null) {
        String? error = await _userService.createUpdateUser(AppUser(
          id: result.user!.uid,
          fullName: nameValue!,
          photoUrl: "",
          email: result.user!.email!,
          userRole: userRoleValue!,
          latitude: 0.0,
          longitude: 0.0,
          place: "",
          regTime: DateTime.now(),
          homeLat: 0.0,
          homeLong: 0.0,
          phone: "",
          
        ));
        if (error == null) {
          await _userService.fetchUser();
          if (_userService.user!.userRole == "patient") {
            _navigationService.pushNamedAndRemoveUntil(Routes.patientView);
          } else {
            _navigationService.pushNamedAndRemoveUntil(Routes.doctorView);
          }
        } else {
          log.i("Firebase error");

          _snackBarService.showSnackbar(message: "Upload Error: $error");
        }
      } else {
        log.i("Error: ${result.errorMessage}");
        _snackBarService.showSnackbar(
            message:
                "Error: ${result.errorMessage ?? "Enter valid credentials"}");
      }
    }
    setBusy(false);
  }
}
