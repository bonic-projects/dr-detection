// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:diabeticretinopathydetection/ui/views/chat/chat_view.dart'
    as _i10;
import 'package:diabeticretinopathydetection/ui/views/doctor/doctor_view.dart'
    as _i7;
import 'package:diabeticretinopathydetection/ui/views/home/aler_widget/aler_widget_view.dart'
    as _i9;
import 'package:diabeticretinopathydetection/ui/views/home/home_view.dart'
    as _i2;
import 'package:diabeticretinopathydetection/ui/views/login/login_view.dart'
    as _i5;
import 'package:diabeticretinopathydetection/ui/views/login_register/login_register_view.dart'
    as _i4;
import 'package:diabeticretinopathydetection/ui/views/patient/patient_view.dart'
    as _i8;
import 'package:diabeticretinopathydetection/ui/views/register/register_view.dart'
    as _i6;
import 'package:diabeticretinopathydetection/ui/views/startup/startup_view.dart'
    as _i3;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginRegisterView = '/login-register-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const doctorView = '/doctor-view';

  static const patientView = '/patient-view';

  static const alerWidgetView = '/aler-widget-view';

  static const chatView = '/chat-view';

  static const all = <String>{
    homeView,
    startupView,
    loginRegisterView,
    loginView,
    registerView,
    doctorView,
    patientView,
    alerWidgetView,
    chatView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginRegisterView,
      page: _i4.LoginRegisterView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i6.RegisterView,
    ),
    _i1.RouteDef(
      Routes.doctorView,
      page: _i7.DoctorView,
    ),
    _i1.RouteDef(
      Routes.patientView,
      page: _i8.PatientView,
    ),
    _i1.RouteDef(
      Routes.alerWidgetView,
      page: _i9.AlerWidgetView,
    ),
    _i1.RouteDef(
      Routes.chatView,
      page: _i10.ChatView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i2.HomeView(key: args.key, meetingid: args.meetingid),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginRegisterView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginRegisterView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.RegisterView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.RegisterView(),
        settings: data,
      );
    },
    _i7.DoctorView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DoctorView(),
        settings: data,
      );
    },
    _i8.PatientView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.PatientView(),
        settings: data,
      );
    },
    _i9.AlerWidgetView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.AlerWidgetView(),
        settings: data,
      );
    },
    _i10.ChatView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ChatView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.meetingid,
  });

  final _i11.Key? key;

  final String meetingid;

  @override
  String toString() {
    return '{"key": "$key", "meetingid": "$meetingid"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.meetingid == meetingid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ meetingid.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i11.Key? key,
    required String meetingid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, meetingid: meetingid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginRegisterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoctorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.doctorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.patientView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAlerWidgetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.alerWidgetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i11.Key? key,
    required String meetingid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, meetingid: meetingid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginRegisterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoctorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.doctorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.patientView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAlerWidgetView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.alerWidgetView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
