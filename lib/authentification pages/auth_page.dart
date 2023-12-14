import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';




class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _MyAuthPageState();
}



class _MyAuthPageState extends State<AuthPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final AppleSignIn _appleSignIn = AppleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  User? _user;
  
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (_user == null) {
      return Scaffold(
        appBar: AppBar(
          title:const Center(child:  Text('Your personalized doctor awaits', style: TextStyle(fontSize: 13),)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image(image: const AssetImage('assets/yatsi(logo).png'), width: height/4,),
                const Text('Please sign in to continue'),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                   
                    
                    ElevatedButton(
                      
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          // Handle error
                        }
                      },
                      child: const Text('Sign in', style: TextStyle( fontSize: 12),),
                    ),
                    const SizedBox(height: 20.0),
                    const Text('------------------ Or ------------------', style: TextStyle( fontSize: 10),),
                    const SizedBox(height: 20.0),
                    /////////////////////////////
                    // GOOGLE SIGN IN BUTTON
                      SizedBox(width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                            onPressed: () async {
                              final UserCredential? userCredential = await signInWithGoogle();
                              if (userCredential != null) {
                                // Successful Google sign-in
                              } else {
                                // Handle Google sign-in error
                              }
                            },
                            child: const Image(image: AssetImage('assets/google logo.png',),width: 20,),
                                                ),
                        
                        
                                                 ElevatedButton(
                          onPressed: () async {},
                          child: const Image(image: AssetImage('assets/apple_logo.png'), width: 20,),
                        ),
                        
                          ],
                        ),
                      ),
                    
                   
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome, ${_user!.displayName}'),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    _user = null;
                  });
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    
    }
    return null;
    }
    }