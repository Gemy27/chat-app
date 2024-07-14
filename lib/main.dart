import 'package:chatapp2/Screens/ChatPage.dart';
import 'package:chatapp2/Screens/LoginPage.dart';
import 'package:chatapp2/Screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Pacifico",
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Colors.white,
                fontFamily: "Pacifico",
                fontWeight: FontWeight.bold,
                fontSize: 25),
            displayMedium: TextStyle(
                color: Colors.white,
                fontFamily: "Pacifico",
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
      home: Login(),
      routes: {
        Login.id: (context) => Login(),
        SignUp.id: (context) => SignUp(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: Login.id,
    );
  }
}
