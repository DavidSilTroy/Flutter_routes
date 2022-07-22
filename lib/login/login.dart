import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../routes/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: unused_field
  late SignupData _data;
  bool _isSignedIn = false;
  bool isSignUpComplete = false;

  Future<String?>? _onLogin(LoginData data) async {
    setState(() {
      _isSignedIn = true;
    });
    return null;
  }

  Future<String?>? _onSignup(SignupData data) async {
    setState(() {
      isSignUpComplete = true;
      _isSignedIn = false;
      _data = data;
    });
    return null;
  }

  Future<String?>? _onRecoverPassword(
      BuildContext context, String email) async {
    Navigator.of(context).goToNewPassword(LoginData(name: email, password: ''));

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Welcome',
      onLogin: _onLogin,
      onSignup: _onSignup,
      onRecoverPassword: (String email) => _onRecoverPassword(context, email),
      theme: LoginTheme(
        // inputTheme: const InputDecorationTheme(fillColor: Colors.blueAccent),
        // cardTheme: const CardTheme(),
        primaryColor: Theme.of(context).primaryColor,
      ),
      onSubmitAnimationCompleted: () {
        print('Pusheado');
        if (_isSignedIn) {
          print('Vamololo');
          Navigator.of(context).goToHomeNew();
        } else {
          print('Vamo');
          Navigator.of(context).goToConfirmationCode(_data);
        }
      },
    );
  }
}
