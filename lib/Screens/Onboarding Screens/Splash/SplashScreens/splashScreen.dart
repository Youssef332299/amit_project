import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../Routes/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    handleData(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(scale: 1.7, "assets/Spashcreen.png"),
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<void> handleData(context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.pageView, (route) => false);
  }
}
