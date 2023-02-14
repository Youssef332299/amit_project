import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                SizedBox(width: 230,),
                Text("Skip",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
              ],
            ),
            Container(
                height: 600,
                width: double.infinity,
                child: PageView(
                  children: [
                    Image.asset(scale: 1.0, "assets/Onboarding3.png"),
                  ],
                )),
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
                onPressed: () {},
                child: const Text(
                  "Get Started",
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
  }
}
