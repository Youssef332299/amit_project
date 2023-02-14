import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../Routes/routes.dart';

class Onboarding2Screen extends StatefulWidget {
  const Onboarding2Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding2Screen> createState() => _Onboarding2ScreenState();
}

class _Onboarding2ScreenState extends State<Onboarding2Screen> {
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
                  GestureDetector(
                    onTap: () {
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
                child: Image.asset(scale: 1.0, "assets/Onboarding2.png"),
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
                    (context).read().state.PageController.NextPage;
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
