import 'package:booking/shared/extras/timer_token.dart';
import 'package:flutter/material.dart';

class AdvanceOtp extends StatefulWidget {
  const AdvanceOtp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AdvanceOtp createState() => _AdvanceOtp();
}

class _AdvanceOtp extends State<AdvanceOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              const SizedBox(height: 20),
              const Text('OTP Advance'),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    );
                  })),
              const SizedBox(
                height: 10,
              ),
              TimerToken(),
              // PinCodeTextField(
              //   appContext: context,
              //   length: 6,
              //   keyboardType: TextInputType.number,
              //   animationType: AnimationType.fade,
              //   pinTheme: PinTheme(
              //     shape: PinCodeFieldShape.box,
              //     borderRadius: BorderRadius.circular(10),
              //     fieldHeight: 50,
              //     fieldWidth: 40,
              //     activeFillColor: Colors.white,
              //   ),
              //   onChanged: (value) {},
              // ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Continue'))
            ],
          ),
        ),
      ),
    );
  }
}
