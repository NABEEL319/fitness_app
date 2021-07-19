import 'package:fitness_app/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

var pages = [
  PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network("assets/images/img1.png", height: 175.0),
    ),
    decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
  ),
  PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network("assets/images/img2.png", height: 175.0),
    ),
    decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
  ),
  PageViewModel(
    title: "Title of first page",
    body:
        "Here you can write the description of the page, to explain someting...",
    image: Center(
      child: Image.network("assets/images/img3.png", height: 175.0),
    ),
    decoration: PageDecoration(
        pageColor: Color(0xff192a56),
        bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24)),
  )
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff192a56),
        child: IntroductionScreen(
          color: Color(0xff192a56),
          pages: pages,
          onDone: () {
            // When done button is press
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (builder) => HomePage()));
          },
          onSkip: () {
            // You can also override onSkip callback
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (builder) => HomePage()));
          },
          showSkipButton: true,
          skip: const Icon(
            Icons.skip_next,
          ),
          next: const Icon(Icons.arrow_right),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.deepOrange,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
