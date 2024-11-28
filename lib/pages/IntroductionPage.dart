import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:package_flutter/pages/LoginPage.dart';
import 'HomePage.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: true,
      next: Text("next>>"),
      pages: [
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Image.network("https://picsum.photos/200"),
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset("assets/lotties/lottie1.json",
                  fit: BoxFit.contain),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page",
          body: "Welcome to the app! This is a description of how it works.",
          image: Center(
            // child: Image.network("https://picsum.photos/200/200"),
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset("assets/lotties/lottie2.json",
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ],
      done: const Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      onDone: () {
        // ketika menggunakan push replacement, tidak bisa kembali lagi
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }
}
