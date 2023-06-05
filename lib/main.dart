import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/credential_povider.dart';
import 'view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CredentialsProvider(),
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
