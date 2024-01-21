import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/views/buyers/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCo_Bd9uj-b_E0sIorDeHhkVaTXagEAPXA", 
      appId: "1:183261802238:android:a0a692a4c4f495e072ffaf", 
      messagingSenderId: "183261802238", 
      projectId: "store-app-movil",
      storageBucket: "gs://store-app-movil.appspot.com"
    )
  ) : Firebase.initializeApp();
  runApp(const MyApp());
} 
  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Brand-Bold'
      ),
      title: 'Material App',
      home: const MainScreen(),
    );
  }
}
