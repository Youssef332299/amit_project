import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../GetStarted/GetStarted Screen/GetStartedScreen.dart';
import '../../Onboarding 2/Onboarding 2 Screen/onboarding2Screen.dart';
import '../../Onboarding/Onboarding Screen/onboardingScreen.dart';
import '../Page View Provider/pageViewProvider.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {

 late PageController Scroll;

@override
  void initState() {
Scroll = new PageController(initialPage: 0);
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: PageView(
              controller: Scroll,
              children: const [
                OnboardingScreen(),
                Onboarding2Screen(),
                GetStartedScreen(),
              ],
            )),
      );
    });
  }
}
