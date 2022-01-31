import 'package:copy_client/firebase_functions/firebase_functions.dart';
import 'package:copy_client/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyC92M-k1fRGXBeurQ9lNDH_FcSlqfZ8iO4",
        authDomain: "vision-text-c0b20.firebaseapp.com",
        projectId: "vision-text-c0b20",
        storageBucket: "vision-text-c0b20.appspot.com",
        messagingSenderId: "17278352905",
        appId: "1:17278352905:web:0d13d2f1e01fd749d542d8"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      // ignore: unused_local_variable
      User _user = await _auth.signInAnon();
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desktop Text Copy Client',
      theme: ThemeData(
        fontFamily: 'Euclid',
        primaryColor: Colors.black,
        primarySwatch: const MaterialColor(0xffb1c5c5, {
          50: Color.fromRGBO(126, 124, 127, .1),
          100: Color.fromRGBO(126, 124, 127, .2),
          200: Color.fromRGBO(126, 124, 127, .3),
          300: Color.fromRGBO(126, 124, 127, .4),
          400: Color.fromRGBO(126, 124, 127, .5),
          500: Color.fromRGBO(126, 124, 127, .6),
          600: Color.fromRGBO(126, 124, 127, .7),
          700: Color.fromRGBO(126, 124, 127, .8),
          800: Color.fromRGBO(126, 124, 127, .9),
          900: Color.fromRGBO(126, 124, 127, 1),
        }),
      ),
      home: const HomePage(),
    );
  }
}
