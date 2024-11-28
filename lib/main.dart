import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';
// import 'package:package_flutter/pages/HomePage.dart';
// import 'package:package_flutter/pages/ProfilePage.dart';
// import 'package:introduction_screen/introduction_screen.dart';
import 'package:package_flutter/pages/DropDownAPIPage.dart';
// import 'package:package_flutter/pages/DropDownPage.dart';
// import 'package:package_flutter/pages/HomePage.dart';
// import 'package:package_flutter/pages/IntroductionPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // var faker = new Faker();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropDownAPIPage(),
    );
  }
}
