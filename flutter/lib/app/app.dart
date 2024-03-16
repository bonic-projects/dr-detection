import 'package:diabeticretinopathydetection/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:diabeticretinopathydetection/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:diabeticretinopathydetection/ui/views/home/home_view.dart';
import 'package:diabeticretinopathydetection/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:diabeticretinopathydetection/ui/views/login_register/login_register_view.dart';
import 'package:diabeticretinopathydetection/ui/views/login/login_view.dart';
import 'package:diabeticretinopathydetection/ui/views/register/register_view.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:diabeticretinopathydetection/services/firestore_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginRegisterView),

    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: SnackbarService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
