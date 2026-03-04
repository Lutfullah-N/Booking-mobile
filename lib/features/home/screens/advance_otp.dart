import 'package:flutter/material.dart';
import 'package:booking/shared/extras/timer_token.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class AdvanceOtp extends StatefulWidget {
  const AdvanceOtp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdvanceOtpState createState() => _AdvanceOtpState();
}

class _AdvanceOtpState extends State<AdvanceOtp> {
  String currentOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter the 6‑digit code sent to your email/phone',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Timer countdown widget
              TimerToken(),
              const SizedBox(height: 20),
              // PinCodeTextField(
              //   appContext: context,
              //   length: 6,
              //   keyboardType: TextInputType.number,
              //   animationType: AnimationType.fade,
              //   pinTheme: PinTheme(
              //     shape: PinCodeFieldShape.box,
              //     borderRadius: BorderRadius.circular(8),
              //     fieldHeight: 50,
              //     fieldWidth: 45,
              //     activeFillColor: Colors.white,
              //     inactiveFillColor: Colors.grey.shade200,
              //     selectedFillColor: Colors.blue.shade50,
              //     activeColor: Colors.blueAccent,
              //     inactiveColor: Colors.grey,
              //     selectedColor: Colors.blueAccent,
              //   ),
              //   onChanged: (value) {
              //     setState(() => currentOtp = value);
              //   },
              // ),
              const SizedBox(height: 30),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentOtp.length == 6) {
                      Navigator.pushReplacementNamed(context, '/login');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter all 6 digits')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Resend option
              TextButton(
                onPressed: () {
                  // TODO: implement resend OTP logic
                },
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
