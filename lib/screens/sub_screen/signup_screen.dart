import 'package:blog_club/screens/home.dart';
import 'package:blog_club/wigets/customButton.dart';
import 'package:blog_club/wigets/squareTile.dart';
import 'package:blog_club/wigets/textField.dart';
import 'package:flutter/material.dart';

class signup_screen extends StatelessWidget {
  const signup_screen({
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
              'Register Here',
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
              'Create an account for free',
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
            const EmailField(hintText: 'Email', icon: Icons.alternate_email),
            const SizedBox(
              height: 10,
            ),
            const PasswordField(hintText: 'Password', icon: Icons.lock,),
            const SizedBox(
              height: 10,
            ),
            const PasswordField(hintText: 'Re-Type Password', icon: Icons.lock,),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        HomePage()),
                  );
                },
                buttonName: 'SIGN UP',
                textColor: Colors.white,
                buttonColor: Colors.blue),

            const SizedBox(
              height: 30,
            ),
            // Don't have account? register now
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: (){
                    tabController.animateTo(0);
                  },
                  child: const Text(
                    'Login Here',
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