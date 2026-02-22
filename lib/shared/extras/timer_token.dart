import 'dart:async';

import 'package:flutter/material.dart';

class TimerToken extends StatefulWidget {
  const TimerToken({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimerTokenState createState() => _TimerTokenState();
}

class _TimerTokenState extends State<TimerToken> {
  int _start = 10;
  Timer? _timer;
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 59), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "$_start",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          // ElevatedButton(onPressed: startTimer, child: Text('Start Timer'))
        ],
      ),
    );
  }
}
