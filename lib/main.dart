import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadiumapp/provider/dataProvider.dart';
import 'package:stadiumapp/provider/ticketDataProvider.dart';
import 'package:stadiumapp/view/screens/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC9PtWCgmyHUoTYXTOLYz7KzWoMWFQfAX4",
          appId: "1:568287323336:android:e957fe1372a433aefc71fd",
          messagingSenderId: "568287323336",
          projectId: "stadium-37525"));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TicketDataProvider()),
      ChangeNotifierProvider(create: (_) => AuthDataProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homescreen(),
    );
  }
}
