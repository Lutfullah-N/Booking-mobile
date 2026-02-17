import 'package:booking/shared/widgets/splite_button.dart' as split_btn;
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.hotel, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Booking App',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Book Hotel, Taxi, Flight and more with ease.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 23, 31, 74),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              split_btn.SplitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
