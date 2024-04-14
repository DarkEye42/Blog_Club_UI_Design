import 'package:blog_club/screens/home.dart';
import 'package:blog_club/wigets/customButton.dart';
import 'package:blog_club/wigets/squareTile.dart';
import 'package:blog_club/wigets/textField.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Tab controller
    TabController _tabController = TabController(length: 2, vsync: this);

    // Text field controllers
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 50, left: 50, bottom: 20),
                child: Image.asset('lib/assets/logo.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.blue),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.transparent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Welcome back',
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
                                        const Text(
                                          'Sign Up Now',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF0D253C),
                                  fontSize: 34,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
