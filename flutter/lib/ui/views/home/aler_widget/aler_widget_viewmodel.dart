
import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlerWidgetViewModel extends BaseViewModel {
  final _naviigatorService = locator<NavigationService>();
  final _userService = locator<UserService>();
  //final _movementDatabaseService = locator<MovementDatabaseService>();

  

  void popPop() {
    _naviigatorService.popRepeated(1);
  }

  

  
  void popback() {
      
    
    _userService.deleteVideoId();
  
    _naviigatorService.pushNamedAndRemoveUntil(Routes.patientView);
  }

  
}
