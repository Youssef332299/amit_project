import 'package:amit_project/Screens/Onboarding%20Screens/Page%20View/Page%20View%20Screen/pageViewScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Routes/routes.dart';
import 'Screens/Categories/CategoriesProvider/categoriesProvider.dart';
import 'Screens/Favorites/FavoritesProvider/favoritesProvider.dart';
import 'Screens/Home/HomeProvider/homeProvder.dart';
import 'Screens/Home/HomeScreen/homeScreen.dart';
import 'Screens/Log_in/LoginProvider/loginProvider.dart';
import 'Screens/Log_in/LoginScreen/loginScreen.dart';
import 'Screens/Onboarding Screens/GetStarted/GetStarted Provider/GetStartedProvider.dart';
import 'Screens/Onboarding Screens/GetStarted/GetStarted Screen/GetStartedScreen.dart';
import 'Screens/Onboarding Screens/Onboarding 2/Onboarding 2 Provider/onboarding2Provider.dart';
import 'Screens/Onboarding Screens/Onboarding 2/Onboarding 2 Screen/onboarding2Screen.dart';
import 'Screens/Onboarding Screens/Onboarding/Onboarding Provider/onboardingProvider.dart';
import 'Screens/Onboarding Screens/Onboarding/Onboarding Screen/onboardingScreen.dart';
import 'Screens/Onboarding Screens/Page View/Page View Provider/pageViewProvider.dart';
import 'Screens/Onboarding Screens/Splash/SplashProvider/splashProvider.dart';
import 'Screens/Onboarding Screens/Splash/SplashScreens/splashScreen.dart';
import 'Screens/Search/SearchProvider/searchProvider.dart';
import 'Screens/Search/SearchScreen/searchScreen.dart';
import 'Screens/Settings/SettingsProvider/settingsProvider.dart';
import 'Screens/Settings/SettingsScreen/settingsScreen.dart';
import 'Screens/SignIn/SignInProvider/signInProvider.dart';
import 'Screens/SignIn/SignInScreen/signInScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<SplashProvider>(
              create: (context) => SplashProvider()),
          ChangeNotifierProvider<SettingsProvider>(
              create: (context) => SettingsProvider()),
          ChangeNotifierProvider<LoginProvider>(
              create: (context) => LoginProvider()),
          ChangeNotifierProvider<SignInProvider>(
              create: (context) => SignInProvider()),
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider()),
          ChangeNotifierProvider<FavoritesProvider>(
              create: (context) => FavoritesProvider()),
          ChangeNotifierProvider<CategoriesProvider>(
              create: (context) => CategoriesProvider()),
          ChangeNotifierProvider<SearchProvider>(
              create: (context) => SearchProvider()),
          ChangeNotifierProvider<OnboardingProvider>(
              create: (context) => OnboardingProvider()),
          ChangeNotifierProvider<Onboarding2Provider>(
              create: (context) => Onboarding2Provider()),
          ChangeNotifierProvider<GetStartedProvider>(
              create: (context) => GetStartedProvider()),
          ChangeNotifierProvider<PageViewProvider>(
              create: (context) => PageViewProvider()),
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              Routes.init: (context) => SplashScreen(),
              Routes.onboarding: (context) => OnboardingScreen(),
              Routes.onboarding2: (context) => Onboarding2Screen(),
              Routes.getStarted: (context) => GetStartedScreen(),
              Routes.login: (context) => LoginScreen(),
              Routes.signin: (context) => SigninScreen(),
              Routes.home: (context) => HomeScreen(),
              Routes.search: (context) => SearchScreen(),
              Routes.setting: (context) => SettingsScreen(),
              Routes.pageView: (context) => PageViewScreen(),
            },
          );
        }),
      );
    });
  }
}
