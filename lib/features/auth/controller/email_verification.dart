import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<EmailVerification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isVerified = false;
  String feedbackMessage = "";

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      setState(() {
        feedbackMessage = 'Verification email Sent! Please check your inbox ';
      });
    } catch (e) {
      setState(() {
        feedbackMessage = "Error: ${e.toString()}";
      });
    }
  }

  Future<void> checkVerificationStatus() async {
    await _auth.currentUser?.reload();
    setState(() {
      isVerified = _auth.currentUser?.emailVerified ?? false;
      feedbackMessage = isVerified
          ? "Your Email us verified! 💐"
          : "Email not verified yet. Please check your inbox";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: sendEmailVerification,
              child: Text('Send Verification Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkVerificationStatus,
              child: Text('Check Verification Status'),
            ),
            SizedBox(height: 16),
            Text(
              feedbackMessage,
              style: TextStyle(
                color: isVerified ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
