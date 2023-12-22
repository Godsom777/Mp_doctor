import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: InkWell(
          onTap: () async => await FirebaseAuth.instance.signOut(),
          child: Text('LogOut'),
        ),
      ),
    );
  }
}
