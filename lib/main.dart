import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mp_doctor/authentification%20pages/auth_page.dart';
import 'package:provider/provider.dart';
// import 'pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_doctor/pages/router.dart';

Color myBgColor = const Color(0xFFEFF1EE);

//theme Data
// light Theme
final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: myBgColor,
    primaryColor: Colors.cyan, // Primary Color
    hintColor: Colors.orange, // accent Color

    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.black38),
          bodyMedium: const TextStyle(color: Colors.black38),
          bodySmall: const TextStyle(color: Colors.black38),
        ));

// dark theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black45,
    primaryColor: const Color.fromARGB(255, 0, 162, 212), // Primary Color
    hintColor: const Color.fromARGB(255, 255, 25, 0),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.white70),
          bodyMedium: const TextStyle(color: Colors.white70),
          bodySmall: const TextStyle(color: Colors.white70),
        ) // accent Color
    );

// Theme Mode selection

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Initialize ThemeProvider
      child: const MyApp()));
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
    ThemeData(
      textTheme: GoogleFonts.montserratAlternatesTextTheme(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/home': (context) => const MyRouter(),
        '/signup': (context) => const AuthPage(),
      },
    );
  }
}

// ADD THEME CHANGING TOGGLE BUTTON