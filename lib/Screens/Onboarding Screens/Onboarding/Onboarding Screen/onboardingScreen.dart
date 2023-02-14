import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Routes/routes.dart';
import '../../../Onboarding Screens/GetStarted/GetStarted Screen/GetStartedScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    // height: 50,
                    child: Image.asset("assets/Logo.png"),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(Routes.login);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 600,
                width: double.infinity,
                child: Image.asset(scale: 1.0, "assets/Onboarding.png"),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 18),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.onboarding2);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
