import 'package:blog_club/screens/home.dart';
import 'package:blog_club/wigets/customButton.dart';
import 'package:blog_club/wigets/squareTile.dart';
import 'package:blog_club/wigets/textField.dart';
import 'package:flutter/material.dart';

class login_screen extends StatelessWidget {
  const login_screen({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D253C),
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sign in with your account',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Color(0xFF0D253C),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const UsernameField(
                hintText: 'Username',
                icon: Icons.person),
            const SizedBox(
              height: 10,
            ),
            const PasswordField(hintText: 'Password'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const HomePage()),
                  );
                },
                buttonName: 'LOGIN',
                textColor: Colors.white,
                buttonColor: Colors.blue),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0),
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16),
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
            const SizedBox(
              height: 20,
            ),
            // google + facebook sign in buttons
            const Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                // google button
                SquareTile(
                    imagePath: 'lib/assets/google.png'),

                SizedBox(
                  width: 20,
                ),

                // facebook button
                SquareTile(
                    imagePath:
                    'lib/assets/facebook.png'),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            // Don't have account? register now
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account?',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: (){
                    tabController.animateTo(1);
                  },
                  child: const Text(
                    'Sign Up Now',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}