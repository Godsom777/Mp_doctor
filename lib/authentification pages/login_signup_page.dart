import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mp_doctor/components/my_button.dart';
import 'package:mp_doctor/components/my_textfield.dart';
import 'package:mp_doctor/components/square_tile.dart';

// sign in with google and Apple packages
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

GlobalKey<ScaffoldState> myanimationkey = GlobalKey<ScaffoldState>();

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

// sign user in method
  void signUserIn() async {
    // Show the loading animation
    showDialog(
      context: myanimationkey.currentContext!,
      builder: (context) => Center(
        child: Image.asset(
          'assets/load.gif',
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (error) {
      // Handle any errors here, e.g., show an error message to the user
    }

    // After the await block, close the loading animation
    Navigator.pop(myanimationkey.currentContext!);
  }

  Future<void> handleAppleSignIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // Use the `credential` object to access user information.
    print('User Identifier: ${credential.userIdentifier}');
    print('Email: ${credential.email}');
    print('Given Name: ${credential.givenName}');
    print('Family Name: ${credential.familyName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myanimationkey,
      // ...

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo
                Image.asset(
                  'assets/yatsi(logo).png',
                  height: 200,
                ),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 20),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google button
                    SquareTile(
                      imagePath: 'assets/google logo.png',
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn().signIn();
                          if (googleUser != null) {
                            // Successfully signed in with Google, you can proceed here.
                            if (kDebugMode) {
                              print('Signed in as: ${googleUser.displayName}');
                            }
                          }
                        } catch (error) {
                          // Handle any sign-in errors here
                          if (kDebugMode) {
                            print('Error signing in: $error');
                          }
                        }
                      },
                    ),

                    SizedBox(width: 25),

                    // Apple button
                    SquareTile(
                      imagePath: 'assets/apple_logo.png',
                      onPressed: () => handleAppleSignIn(),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Color.fromARGB(255, 243, 33, 33),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
