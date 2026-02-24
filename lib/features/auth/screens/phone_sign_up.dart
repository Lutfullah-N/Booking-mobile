import 'package:flutter/material.dart';

class PhoneSignUp extends StatefulWidget {
  const PhoneSignUp({super.key});
  @override
  State<PhoneSignUp> createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 0, 0),
          foregroundColor: Colors.white,
          title: Text('Sign Up By Phone Number'),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Phone num (+9300000000)',
                      prefixIcon: const Icon(Icons.phone),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (_phoneController.text.isEmpty ||
                            !_phoneController.text.startsWith('+')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please enter a valid phone number!')),
                          );
                          return;
                        }
                        Navigator.of(context).pushReplacementNamed('/otpBasic');
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or Continue With'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    label: const Text('Email'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/emailSingUp');
                    },
                    icon: Icon(Icons.email_rounded),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('Google'),
                    icon: Icon(Icons.g_mobiledata_rounded),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'By Signing in or Sign up you agree to our Terms of Services and Privacy Policies!',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
