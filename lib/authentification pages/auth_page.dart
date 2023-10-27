import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mp_doctor/authentification%20pages/login_signup_page.dart';
import 'package:mp_doctor/pages/home_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream:  FirebaseAuth.instance.authStateChanges(),
      builder: ( context, snapshot) {
        //User logged in
        if (snapshot.hasData) {
          return HomePage();
        }

        //user not logged in
        else {
          return LoginPage();
        }
      }
      )
    );
  }
}