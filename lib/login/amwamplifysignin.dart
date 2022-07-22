// import 'package:amplify_authenticator/amplify_authenticator.dart';
// import 'package:flutter/material.dart';

// import '../home/home.dart';

// class SignInLito extends StatelessWidget {
//   const SignInLito({Key? key}) : super(key: key);

//   state() => state();

//   @override
//   Widget build(BuildContext context) {
//     return Authenticator(
//       // builder used to show a custom sign in and sign up experience
//       authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
//         const padding =
//             EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
//         switch (state.currentStep) {
//           case AuthenticatorStep.signIn:
//             return Scaffold(
//               body: Padding(
//                 padding: padding,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // app logo
//                       Center(
//                         child: SizedBox(
//                             child: Hero(
//                                 tag: 'signlogoLito',
//                                 child: Image.asset(
//                                   'assets/images/lito.png',
//                                   width: 250.0,
//                                   height: 250.0,
//                                 ))),
//                       ),
//                       // prebuilt sign in form from amplify_authenticator package
//                       SignInForm(),
//                     ],
//                   ),
//                 ),
//               ),
//               // custom button to take the user to sign up
//               persistentFooterButtons: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Don\'t have an account?'),
//                     TextButton(
//                       onPressed: () => state.changeStep(
//                         AuthenticatorStep.signUp,
//                       ),
//                       child: const Text('Sign Up'),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           case AuthenticatorStep.signUp:
//             return Scaffold(
//               body: Padding(
//                 padding: padding,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // app logo
//                       Center(
//                         child: SizedBox(
//                             width: 200.0,
//                             height: 200.0,
//                             child: Hero(
//                                 tag: 'signlogoLito',
//                                 child: Image.asset(
//                                   'assets/images/lito.png',
//                                   width: 250.0,
//                                   height: 250.0,
//                                 ))),
//                       ),
//                       // prebuilt sign up form from amplify_authenticator package
//                       SignUpForm(),
//                     ],
//                   ),
//                 ),
//               ),
//               // custom button to take the user to sign in
//               persistentFooterButtons: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already have an account?'),
//                     TextButton(
//                       onPressed: () => state.changeStep(
//                         AuthenticatorStep.signIn,
//                       ),
//                       child: const Text('Sign In'),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           default:
//             // returning null defaults to the prebuilt authenticator for all other steps
//             return null;
//         }
//       },
//       child: MaterialApp(
//         builder: Authenticator.builder(),
//         home: const Home(),
//       ),
//     );
//   }
// }
