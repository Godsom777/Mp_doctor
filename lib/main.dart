import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:mp_doctor/authentification%20pages/auth_page.dart';
import 'package:provider/provider.dart';
// import 'pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_doctor/pages/router.dart';

import 'pages/ask_ai.dart';

Color myBgColor = const Color(0xFFEFF1EE);
Color logoColor = const Color(0xff3F3F69);

//theme Data
// light Theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: myBgColor,
  primaryColor: const Color.fromARGB(245, 254, 255, 255), // Primary Color
  hintColor: const Color.fromARGB(255, 0, 115, 255), // accent Color

  textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(color: logoColor),
        bodyMedium: TextStyle(color: logoColor),
        bodySmall: TextStyle(color: logoColor),
      ),
  cardTheme: CardTheme(
    color: const Color(0xffFBFDFA),
    shadowColor: Colors.black38,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);

// dark theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
    primaryColor: const Color.fromARGB(255, 0, 162, 212), // Primary Color
    hintColor: const Color.fromARGB(255, 255, 25, 0),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: TextStyle(color: myBgColor),
          bodyMedium: TextStyle(color: myBgColor),
          bodySmall: TextStyle(color: myBgColor),
        ) // accent Color
    );

// Theme Mode selection

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  Color myBgColor = const Color(0xFFEFF1EE);
  String logoImageLight = 'assets/yatsi(logo).png';
  String logoImageDark = 'assets/yatsi(logo)dark.png';
  Color myshadowColor = const Color(0x21A4A1B5);
  Color myCardColorLight = const Color(0xffFBFDFA);
  Color cardColorDark = const Color.fromARGB(221, 44, 44, 44);
  Color tabBackgroundColorDark = Colors.redAccent;
  Color tabBackgroundColorLight = const Color.fromARGB(255, 255, 255, 255);

  Color rippleColor = Colors.red[300]!;

  Color get mylogoColor => _themeMode == ThemeMode.dark ? myBgColor : logoColor;
  String get mylogoImage =>
      _themeMode == ThemeMode.dark ? logoImageDark : logoImageLight;
  Color get cardColor =>
      _themeMode == ThemeMode.dark ? cardColorDark : myCardColorLight;
  Color get shadowColor => _themeMode == ThemeMode.dark
      ? const Color.fromARGB(83, 0, 0, 0)
      : myshadowColor;
  Color get mytabBackgroundColor => _themeMode == ThemeMode.dark
      ? tabBackgroundColorDark
      : tabBackgroundColorLight;
  Color get myRippleColor =>
      _themeMode == ThemeMode.dark ? tabBackgroundColorLight : rippleColor;

  ThemeMode get currentTheme => _themeMode;

  void toggleTheme() {
    if (_themeMode == ThemeMode.system) {
      _themeMode = ThemeMode.light;
    } else if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
//////////////////////////////////////////////////
/////////////////////////////////////////
////////////////////////////////
/////////////////////////
/////////////////
///////////
//////
///
// Firebase binding

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: ' AIzaSyDHyf3ryquVc-yT6dVNqzaQWNcmTDVtwQQ');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: const Color(0xff3F3F69)!,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ChatModel()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  ),
      );
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
//////////////////////////////////////////////////
/////////////////////////////////////////
////////////////////////////////
/////////////////////////
/////////////////
///////////
//////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeData(
      textTheme: GoogleFonts.montserratAlternatesTextTheme(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MP Doctor',
      themeMode: themeProvider.currentTheme,
      theme: lightTheme,
      darkTheme: darkTheme,
      // TODO: home: SplashScreen
      home: const AuthPage(),
      routes: {
        '/home': (context) => const MyRouter(),
        '/signup': (context) => const AuthPage(),
      },
    );
  }
}
