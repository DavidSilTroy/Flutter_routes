import 'package:flutter/material.dart';
import '../routes/routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _myHome createState() => _myHome();
}

// ignore: camel_case_types
class _myHome extends State<Home> {
  // AuthUser _user = AuthUser(userId: '', username: '');

  @override
  void initState() {
    // Amplify.Auth.getCurrentUser().then((user) {
    //   setState(() {
    //     // _user = user;
    //   });
    // }).catchError((error) {
    //   // ignore: avoid_print
    //   print((error as AuthException).message);
    // });
    super.initState();
  }

  Future<String> _getName() async {
    // return _user.username;
    return 'Hola';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).goToSignInNew();
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<String?>(
                future: _getName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String data = snapshot.data!;
                    return Text(data);
                  } else {
                    return const Text('loading..');
                  }
                }),
            const Text('Welcome back!'),
            Text(
              'Select an option:',
              style: Theme.of(context).textTheme.headline4,
            ),
            MaterialButton(
              onPressed: () => {
                // Navigator.of(context).goToLitoUserData()
              },
              color: Theme.of(context).primaryColor,
              child: const Text('User Data'),
            ),
            MaterialButton(
              onPressed: () => {
                // Navigator.of(context).goToHouseTemperature()
              },
              color: Theme.of(context).primaryColor,
              child: const Text('Function 1'),
            ),
            MaterialButton(
              onPressed: () => {},
              color: Colors.cyan.shade400,
              child: const Text('Function 2'),
            ),
            MaterialButton(
              onPressed: () => {},
              color: Colors.cyan.shade400,
              child: const Text('Function 3'),
            ),
          ],
        ),
      ),
    );
  }
}
