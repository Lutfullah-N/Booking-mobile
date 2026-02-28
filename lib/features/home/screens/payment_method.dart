import 'dart:async';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Duration remaining = const Duration(minutes: 34); // initial countdown
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining.inSeconds > 0) {
        setState(() {
          remaining = remaining - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final paymentOptions = [
      {"name": "Zalo Pay", "icon": "assets/images/zalo.png"},
      {"name": "PayPal", "icon": "assets/images/paypal.png"},
      {"name": "Visa", "icon": "assets/images/visa.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Booking Topic: Flight"),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total Price",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("231 USD"),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),

            const Text("Payment Methods",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: paymentOptions.length,
                itemBuilder: (context, index) {
                  final option = paymentOptions[index];
                  return ListTile(
                    leading: Image.asset(option["icon"]!, width: 40),
                    title: Text(option["name"]!),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // TODO: handle payment selection
                    },
                  );
                },
              ),
            ),

            // Countdown Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Complete your payment in "),
                Text(
                  _formatTime(remaining),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: handle continue
                },
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
