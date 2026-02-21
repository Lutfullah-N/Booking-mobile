import 'package:flutter/material.dart';
import 'package:booking/features/home/widgets/corousel_dots_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 14, 32),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "B",
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: -3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: "o",
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: -6,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 105, 210, 109)),
                  ),
                  TextSpan(
                    text: "o",
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: -6,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 105, 210, 109)),
                  ),
                  TextSpan(
                    text: "k",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: "i",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: "n",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: "g",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]),
              ),
              const Spacer(),
              const Text(
                'Language',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
              IconButton(
                onPressed: () {
                  // Handle language change
                },
                icon: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.3,
                  //   child: const ImageCarouselWithDots(),
                  // ),
                  const ImageCarouselWithDots(),
                  SizedBox(height: 20),
                  Container(
                    color: const Color.fromARGB(249, 28, 80, 236),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    child: const Text(
                      'Enjoy Booking and \n Appointments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigate to next screen
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 20, vertical: 15),
                  //     decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 31, 158, 52),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: const Text(
                  //       'Sign Up ',
                  //       style: TextStyle(
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black54),
                  //     ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Sign In'))),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Sign up')))
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'By Signing in or Sign up you agree to our Terms of Services \n and private policies',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
