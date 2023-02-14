import 'package:amit_project/Core/Enum/Animation%20Enum/animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard? riveArtboard;
  late RiveAnimationController controlleridle;
  late RiveAnimationController controllerHands_up;
  late RiveAnimationController controllerhands_down;
  late RiveAnimationController controllerLook_down_right;
  late RiveAnimationController controllerLook_down_left;
  late RiveAnimationController controllersuccess;
  late RiveAnimationController controllerfail;
  late RiveAnimationController controllerLook_idle;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();

  String testEmail = "youssefayman329@gmail.com";
  String testpassword = "01093264806";

  bool lookingRight = false;
  bool lookingLeft = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controlleridle);
    riveArtboard?.artboard.removeController(controllerHands_up);
    riveArtboard?.artboard.removeController(controllerhands_down);
    riveArtboard?.artboard.removeController(controllerLook_down_right);
    riveArtboard?.artboard.removeController(controllerLook_down_left);
    riveArtboard?.artboard.removeController(controllersuccess);
    riveArtboard?.artboard.removeController(controllerfail);
    riveArtboard?.artboard.removeController(controllerLook_idle);

    lookingRight = false;
    lookingLeft = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controlleridle);
    debugPrint("idle");
  }

  void addHands_upController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHands_up);
    debugPrint("Hands_up");
  }

  void addhandsdownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerhands_down);
    debugPrint("hands_down");
  }

  void addLook_down_rightController() {
    removeAllControllers();
    lookingRight = true;
    riveArtboard?.artboard.addController(controllerLook_down_right);
    debugPrint("Look_down_right");
  }

  void addLook_down_leftController() {
    removeAllControllers();
    lookingLeft = true;
    riveArtboard?.artboard.addController(controllerLook_down_left);
    debugPrint("Look_down_right");
  }

  void addsuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllersuccess);
    debugPrint("success");
  }

  void addfailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerfail);
    debugPrint("fail");
  }

  void addLook_idleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerLook_idle);
    debugPrint("Look_idle");
  }

  void checkForPasswordFocusNodeToChangeAinmationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHands_upController();
      } else if (!passwordFocusNode.hasFocus) {
        addhandsdownController();
      }
    });
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1),()
    {
      if (formkey.currentState!.validate()) {
        addsuccessController();
      } else {
        addfailController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controlleridle = SimpleAnimation(AnimationEnum.idle.name);
    controllerhands_down = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerHands_up = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerLook_down_left =
        SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerLook_down_right =
        SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerfail = SimpleAnimation(AnimationEnum.fail.name);
    controllersuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerLook_idle = SimpleAnimation(AnimationEnum.Look_idle.name);

    rootBundle.load("assets/animated_login_screen.riv").then((data) {
      final file = RiveFile.import(data);

      final artboard = file.mainArtboard;

      artboard.addController(controlleridle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAinmationState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: riveArtboard == null
                      ? const SizedBox.shrink()
                      : Rive(artboard: riveArtboard!)),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            )),
                        validator: (value) =>
                            value != testEmail ? "Wrong Email" : null,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              value.length < 20 &&
                              !lookingLeft) {
                            addLook_down_leftController();
                          } else if (value.isNotEmpty &&
                              value.length > 20 &&
                              !lookingRight) {
                            addLook_down_rightController();
                          }
                        },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),

                      //Password
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        focusNode: passwordFocusNode,
                        validator: (value) =>
                            value != testpassword ? "Wrong Password" : null,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),

                      //Log In
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 8),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14)),
                          onPressed: () {
                            passwordFocusNode.unfocus();
                            validateEmailAndPassword();
                          },
                          child: const Text(
                            "LogIn",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> handlaData(context) async {}
