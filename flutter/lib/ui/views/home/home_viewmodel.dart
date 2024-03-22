import 'package:diabeticretinopathydetection/app/app.locator.dart';
import 'package:diabeticretinopathydetection/app/app.router.dart';
import 'package:diabeticretinopathydetection/services/videosdk_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
 

  final _videosdkService = locator<VideosdkService>();

  String get sdkToken => _videosdkService.token;

 

  final _navigationService = locator<NavigationService>();

  void alertdialog() {
    _navigationService.navigateTo(Routes.alerWidgetView);
  }
}
