import 'package:blog_club/screens/sub_screen/login_screen.dart';
import 'package:blog_club/screens/sub_screen/signup_screen.dart';
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
    TabController tabController = TabController(length: 2, vsync: this);

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Text field controllers
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: isPortrait
          ? SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 60, right: 50, left: 50, bottom: 20),
                        child: Image.asset('lib/assets/logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white54,
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Tab(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                          indicatorColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 5),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          child: Container(
                            height: screenHeight * 0.75, // Set a finite height
                            decoration: const BoxDecoration(color: Colors.white),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                login_screen(tabController: tabController),
                                signup_screen(tabController: tabController),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          )
          : Row(
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: screenHeight,
                  color: Colors.grey.withOpacity(0.1),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset('lib/assets/logo.png'),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.75,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 0),
                          child: TabBar(
                            controller: tabController,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white54,
                            dividerColor: Colors.transparent,
                            tabs: const [
                              Tab(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                            indicatorColor: Colors.transparent,
                            padding: const EdgeInsets.only(top: 10),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          child: Container(
                            height: screenHeight,
                            width: double.maxFinite,// Set a finite height
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                login_screen(tabController: tabController),
                                signup_screen(tabController: tabController),
                              ],
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
