import 'package:arifapp/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBx4f6-Vmki-tFK7BBDsbbp22lQ_EqYu-0",
          appId: "1:810752920759:android:6c1a465ee0f7e784b95132",
          messagingSenderId: "810752920759",
          projectId: "arifapp-62a6c"));
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}
