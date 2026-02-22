import 'package:flutter/material.dart';

class PhoneUsername extends StatelessWidget {
  const PhoneUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OTP Basic',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  )),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can Verify from the screen no Email!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Verify and agree to sign in with email Address. not high version security recommended use OTP!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                backgroundColor: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                                backgroundColor: Colors.green),
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
                  color: Colors.green,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'User OTP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ))),
            ],
          ),
        ),
      )),
    );
  }
}
