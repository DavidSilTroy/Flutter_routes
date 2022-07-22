import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../login/confirm.dart';
import '../login/confirm_reset.dart';
import '../login/login.dart';
import '../home/home.dart';

class AppRoutes {
  //Login Route//
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String confirm = "/confirm";
  static const String passwordReset = "/confirm_reset";

  //LitoApp route for the Functionalities
  static const String home = "/home";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
          settings: settings,
        );
      case signIn:
        return MaterialPageRoute(
          builder: (context) => const Login(),
          settings: settings,
        );
      case confirm:
        return MaterialPageRoute(
          builder: (context) =>
              ConfirmScreen(data: settings.arguments as SignupData),
          settings: settings,
        );
      case passwordReset:
        return MaterialPageRoute(
          builder: (context) =>
              ConfirmResetScreen(data: settings.arguments as LoginData),
          settings: settings,
        );
    }
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(
                child: Text(
                    "Hey you shouldn't be here.. Route ${settings.name} not found."),
              ),
            ));
  }
}

extension NavigatorsStateExtension on NavigatorState {
  Future<void> goToHomeNew() =>
      pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);

  Future<void> goToSignInNew() =>
      pushNamedAndRemoveUntil(AppRoutes.signIn, (route) => false);

  Future<void> goToConfirmationCode(SignupData data) =>
      pushNamed(AppRoutes.confirm, arguments: data);

  Future<void> goToNewPassword(LoginData data) =>
      pushNamed(AppRoutes.passwordReset, arguments: data);

  // Future<void> goToLoadingNew() =>
  //     pushNamedAndRemoveUntil(AppRoutes.loading, (route) => false);

}
