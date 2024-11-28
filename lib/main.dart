import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';
// import 'package:package_flutter/pages/HomePage.dart';
// import 'package:package_flutter/pages/ProfilePage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:package_flutter/pages/HomePage.dart';
import 'package:package_flutter/pages/IntroductionPage.dart';

void main() {
  // var faker = new Faker();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}
