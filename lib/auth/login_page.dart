import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/Home/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // UserProvider userProvider = Provider.of(context);
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // final User user = (await auth.signInWithCredential(credential)).user;
      // userProvider.addUserData(
      //   currentUser: user,
      //   userEmail: user.email,
      //   userImage: user.photoURL,
      //   userName: user.displayName,
      // );

      return;
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Sign in to contunue'),
                  Text(
                    'Vegi',
                    style:
                        TextStyle(fontSize: 50, color: Colors.white, shadows: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.green.shade900,
                        offset: const Offset(3, 3),
                      )
                    ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Apple,
                        text: "Sign in with Apple",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: () async {
                          await _googleSignUp().then(
                            (value) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        'Terms and Pricacy Policy',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
