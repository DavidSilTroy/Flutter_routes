import 'package:flutter/material.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_login/flutter_login.dart';
import '../routes/routes.dart';

class ConfirmScreen extends StatefulWidget {
  final SignupData data;

  const ConfirmScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _controller = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _verifyCode(BuildContext context, SignupData data, String code) async {
    Navigator.of(context).goToHomeNew();
  }

  void _resendCode(BuildContext context, SignupData data) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text('Confirmation code resent. Check your email',
            style: TextStyle(fontSize: 15)),
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                elevation: 12,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Enter confirmation code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        onPressed: _isEnabled
                            ? () {
                                _verifyCode(
                                    context, widget.data, _controller.text);
                              }
                            : null,
                        elevation: 4,
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.black54,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Text(
                          'VERIFY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          _resendCode(context, widget.data);
                        },
                        child: const Text(
                          'Resend code',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
