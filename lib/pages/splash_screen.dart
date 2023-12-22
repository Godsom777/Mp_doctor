import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    super.initState();

    // Set the splash screen image.
    //FlutterNativeSplash.preserve(image: , widgetsBinding: widgetsBinding );

    // Navigate to the next screen after 3 seconds.
    Future.delayed(const Duration(seconds: 3), () async {
      // Check if the user is registered.
      bool isRegistered = await Future.delayed(const Duration(seconds: 3));
      FlutterNativeSplash
          .remove(); // Make a network request to check if the user is registered.
      if (isRegistered) {
        // Navigate to the home page.
       // Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Navigate to the signup screen.
       // Navigator.pushReplacementNamed(context, '/signup');
      }

      // Remove the splash screen.
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return a blank Container widget.
    return Container();
  }
}
