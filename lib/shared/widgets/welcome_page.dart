import 'package:flutter/material.dart';
import 'package:booking/features/home/widgets/corousel_dots_image.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  String selectedLanguage = 'English';
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
                  showModalBottomSheet(
                      context: Navigator.of(context).context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        String selectedLanguage = 'English';
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Choose Language',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  RadioListTile<String>(
                                    value: "English",
                                    title: const Text('English'),
                                    // ignore: deprecated_member_use
                                    groupValue: selectedLanguage,
                                    // ignore: deprecated_member_use
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLanguage = value!;
                                      });
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.arrow_right_alt_rounded),
                                    title: const Text('Others'),
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)),
                                          ),
                                          backgroundColor: Colors.white,
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                      'Choose Language from List'),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  RadioListTile<String>(
                                                    value: 'Spanish',
                                                    title:
                                                        const Text('Spanish'),
                                                    // ignore: deprecated_member_use
                                                    groupValue:
                                                        selectedLanguage,
                                                    // ignore: deprecated_member_use
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    value: 'Dari',
                                                    title: const Text('Dari'),
                                                    // ignore: deprecated_member_use
                                                    groupValue:
                                                        selectedLanguage,
                                                    // ignore: deprecated_member_use
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    value: 'Pashto',
                                                    title: const Text('Pashto'),
                                                    // ignore: deprecated_member_use
                                                    groupValue:
                                                        selectedLanguage,
                                                    // ignore: deprecated_member_use
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                  RadioListTile<String>(
                                                    value: 'Dutch',
                                                    title: const Text('Dutch'),
                                                    // ignore: deprecated_member_use
                                                    groupValue:
                                                        selectedLanguage,
                                                    // ignore: deprecated_member_use
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      });
                },
                icon: const Icon(
                  Icons.translate,
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
                    // color: const Color.fromARGB(249, 28, 80, 236),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    child: const Text(
                      'Enjoy Booking and \n Appointments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(2),
                        width: 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: () {
                                Navigator.pushNamed(context, '/signOptUp');
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.white),
                              )))
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'By Signing in or Sign up you agree to our Terms of Services \n and private policies',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
