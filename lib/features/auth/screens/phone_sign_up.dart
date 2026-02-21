import 'package:flutter/material.dart';

class PhoneSignUp extends StatelessWidget {
  const PhoneSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 6, 0, 0),
      appBar: AppBar(
        title: Text('Sign Up By Phone Number'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'Phone num (+9300000000)',
                    prefixIcon: Icon(Icons.phone),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none)),
                keyboardType: TextInputType.number,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.singleLineFormatter
                //       .allow(RegExp(r'^\d*\.?\d*$')),
                // ],
                style:
                    TextStyle(color: const Color.fromARGB(255, 150, 132, 132)),
              ),
              Expanded(
                  child: Divider(
                color: Colors.grey,
                thickness: 2,
              )),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context);
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              const SizedBox(height: 140),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or Continue With',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Icon(Icons.facebook)),
                  Expanded(child: Text('FaceBook'))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Image.asset('assets/images/google.png')),
                  Expanded(child: Text('Google'))
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                  'By Signing in or Sign up you agree to our term of Services \n and Privacy Policies!')
            ],
          ),
        ),
      ),
    );
  }
}
