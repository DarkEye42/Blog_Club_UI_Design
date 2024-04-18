import 'package:blog_club/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  // Go to the login page
  void nextPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
      (route) => false,
    );
  }

  final controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: isPortrait ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.5,
                margin: const EdgeInsets.only(top: 40),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Image.asset('lib/assets/imagetiles.png'),
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white, // Background color
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              isLastPage = index == 2;
                            });
                          },
                          controller: controller,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 50, right: 20, left: 20),
                              child: const Column(
                                children: [
                                  Text(
                                    'Read the article you want instantly',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color(0xff0D253C)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'You can read thousands of articles on Blog Club, '
                                    'save them in the application and share them with your loved ones.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xff2D4379),
                                      wordSpacing: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 50, right: 20, left: 20),
                              child: const Column(
                                children: [
                                  Text(
                                    'Discover the articles you crave in an instant',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color(0xff0D253C)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Dive into a world of knowledge with Blog Club, '
                                    'where you can access an array of articles, '
                                    'bookmark the ones that resonate with you, '
                                    'and spread inspiration to those you care about',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xff2D4379),
                                      wordSpacing: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 50, right: 20, left: 20),
                              child: const Column(
                                children: [
                                  Text(
                                    'Access the content you desire right away',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color(0xff0D253C)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Discover a vast library of articles on Blog Club, '
                                    'where you can explore endless topics, save your favorites, '
                                    'and effortlessly share them with friends and family.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xff2D4379),
                                      wordSpacing: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: const ExpandingDotsEffect(
                                dotColor: Color(0xFFDEE7FF),
                                activeDotColor: Colors.blue,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                isLastPage
                                    ?
                                      nextPage(context)
                                    : controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              child: Icon(
                                isLastPage
                                    ? Icons.check
                                    : Icons.arrow_forward_sharp,
                                size: 32,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.5,
              height: screenHeight,
              padding: const EdgeInsets.all(25),
              child: Image.asset('lib/assets/imagetiles.png'),
              //Icon(Icons.android, size: 500,)
            ),
            Container(
              width: screenWidth * 0.5,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: Colors.white, // Background color
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.7,
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          isLastPage = index == 2;
                        });
                      },
                      controller: controller,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, right: 20, left: 20),
                          child: const Column(
                            children: [
                              Text(
                                'Read the article you want instantly',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color(0xff0D253C)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'You can read thousands of articles on Blog Club, '
                                    'save them in the application and share them with your loved ones.',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xff2D4379),
                                  wordSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, right: 20, left: 20),
                          child: const Column(
                            children: [
                              Text(
                                'Discover the articles you crave in an instant',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color(0xff0D253C)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Dive into a world of knowledge with Blog Club, '
                                    'where you can access an array of articles, '
                                    'bookmark the ones that resonate with you, '
                                    'and spread inspiration to those you care about',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xff2D4379),
                                  wordSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, right: 20, left: 20),
                          child: const Column(
                            children: [
                              Text(
                                'Access the content you desire right away',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color(0xff0D253C)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Discover a vast library of articles on Blog Club, '
                                    'where you can explore endless topics, save your favorites, '
                                    'and effortlessly share them with friends and family.',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xff2D4379),
                                  wordSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: screenHeight * 0.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            dotColor: Color(0xFFDEE7FF),
                            activeDotColor: Colors.blue,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            isLastPage
                                ?
                            nextPage(context)
                                : controller.nextPage(
                              duration:
                              const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Icon(
                            isLastPage
                                ? Icons.check
                                : Icons.arrow_forward_sharp,
                            size: 32,
                          ),
                        )
                      ],
                    ),
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
