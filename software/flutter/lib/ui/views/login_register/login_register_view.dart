import 'package:diabeticretinopathydetection/ui/views/login_register/widgets/loginRegister.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_register_viewmodel.dart';

class LoginRegisterView extends StackedView<LoginRegisterViewModel> {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginRegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  width: 350,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  left: 50,
                  bottom: 60,
                  child: Text(
                    "Diabetic Retinopathy Detection",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            LoginRegisterWidget(
              onLogin: viewModel.openLoginView,
              onRegister: viewModel.openRegisterView,
              loginText: "Existing Doctor",
              registerText: "Doctor registration",
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginRegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginRegisterViewModel();
}
